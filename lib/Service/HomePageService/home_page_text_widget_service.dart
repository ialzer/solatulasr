import 'package:geolocator/geolocator.dart';

class HomePageTextWidgetService {
  get refreshLocation => null;

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, return null
      return Future.error('Службы геолокации отключены');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, return null
        return Future.error('Разрешение на геолокацию отклонено');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, return null
      return Future.error('Разрешение на геолокацию навсегда отклонено');
    }

    // Get the current location
    return await Geolocator.getCurrentPosition();
  }
}

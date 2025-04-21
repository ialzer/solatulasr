import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solatulasr/Service/HomePageService/home_page_text_widget_service.dart';

class LocationController extends GetxController {
  String _currentLocation = 'Toshkent';
  String get currentLocation => _currentLocation;
  HomePageTextWidgetService service = HomePageTextWidgetService();

  LocationController() {
    Future.delayed(const Duration(seconds: 2), () {
      _currentLocation =
          HomePageTextWidgetService().getCurrentLocation().toString();
    });
  }
  void refreshLocation() {
    service.getCurrentLocation();
    update();
  }

  set currentLocation(String location) {
    _currentLocation = location;
    update();
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [YourLocationTextWidget(), LocationWidget()],
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());
    return Row(
      children: [
        Text(
          locationController.currentLocation,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: locationController.refreshLocation,
        ),
      ],
    );
  }
}

class YourLocationTextWidget extends StatelessWidget {
  const YourLocationTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sizning joylashuvingiz',
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

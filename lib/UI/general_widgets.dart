import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:solatulasr/Domain/images_app.dart';
import 'package:solatulasr/UI/HomePage/home_page_widget.dart';
import 'package:solatulasr/UI/ProfilePage/profile_page_widget.dart';

class CustomBottomNavBarStateController extends GetxController {
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}

class GeneralWidgets extends StatefulWidget {
  const GeneralWidgets({super.key});

  @override
  State<GeneralWidgets> createState() => _GeneralWidgetsState();
}

class _GeneralWidgetsState extends State<GeneralWidgets> {
  final CustomBottomNavBarStateController controller = Get.put(
    CustomBottomNavBarStateController(),
  );

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  void initLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Службы геолокации отключены");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      print("Разрешение навсегда отклонено");
    }

    Position position = await Geolocator.getCurrentPosition();
    print(
      "Текущее местоположение: ${position.latitude}, ${position.longitude}",
    );
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = 5;

    List icons = [
      ImagesApp.homeIcon,
      ImagesApp.groupIcon,
      ImagesApp.starIcon,
      ImagesApp.locationIcon,
      ImagesApp.profileIcon,
    ];

    List<String> titles = [
      'Asosiy',
      'Kategoriya',
      'Sevimlilar',
      'Lokatsiya',
      'Profil',
    ];
    List<Widget> pages = [
      HomePageWidget(),
      HomePageWidget(),
      HomePageWidget(),
      HomePageWidget(),
      ProfilePageWidget(),
    ];
    return GetBuilder<CustomBottomNavBarStateController>(
      builder:
          (_) => Scaffold(
            body: pages[controller.selectedIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 15.0,
              ),
              child: CustomBottomNavBar.items(
                controller.selectedIndex,
                icons,
                titles,
                itemCount,
              ),
            ),
          ),
    );
  }
}

class CustomBottomNavBar {
  static Widget items(
    int selectedIndex,
    List icons,
    List<String> titles,
    int itemCount,
  ) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          height: 60,
          child: Row(
            children: List.generate(itemCount, (index) {
              if (index == selectedIndex) {
                return Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap:
                        () => Get.find<CustomBottomNavBarStateController>()
                            .changeIndex(index),
                    child: Card(
                      color: Colors.lightBlue,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(icons[index], color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              titles[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                flex: 2,
                child: InkWell(
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  highlightColor: Colors.transparent,

                  onTap:
                      () => Get.find<CustomBottomNavBarStateController>()
                          .changeIndex(index),

                  child: SvgPicture.asset(
                    icons[index],
                    color: Colors.lightBlue,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

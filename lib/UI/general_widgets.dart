import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

class GeneralWidgets extends StatelessWidget {
  GeneralWidgets({super.key});
  final CustomBottomNavBarStateController controller = Get.put(
    CustomBottomNavBarStateController(),
  );
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
            bottomNavigationBar: CustomBottomNavBar.items(
              controller.selectedIndex,
              icons,
              titles,
              itemCount,
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
    return Card(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.1 * 255).toInt()),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            icons[index],
                            color: Colors.lightBlue,
                          ),
                          SizedBox(width: 10),
                          Text(
                            titles[index],
                            style: TextStyle(color: Colors.lightBlue),
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
                onTap:
                    () => Get.find<CustomBottomNavBarStateController>()
                        .changeIndex(index),

                child: SvgPicture.asset(icons[index], color: Colors.white),
              ),
            );
          }),
        ),
      ),
    );
  }
}

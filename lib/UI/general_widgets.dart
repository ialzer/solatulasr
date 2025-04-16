import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solatulasr/UI/HomePage/home_page_widget.dart';

class CustomBottomNavBarState extends GetX {
  static RxInt selectedIndex = 0.obs;
  CustomBottomNavBarState({super.key, required super.builder}) {
    selectedIndex = 0.obs;
  }
  static void changeIndex(int index) {
    selectedIndex = index.obs;
  }
}

class GeneralWidgets extends StatelessWidget {
  const GeneralWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.search,
      Icons.notifications,
      Icons.person,
      Icons.settings,
    ];

    List<String> titles = [
      'Home',
      'Search',
      'Notifications',
      'Profile',
      'Settings',
    ];
    return Scaffold(
      body: HomePageWidget(),
      bottomNavigationBar: CustomBottomNavBarState(
        builder:
            (controller) => CustomBottomNavBar.items(
              context,
              icons,
              titles,
              CustomBottomNavBarState.selectedIndex.value,
            ),
      ),
    );
  }
}

class CustomBottomNavBar {
  static Widget items(
    context,
    List<IconData> icons,
    List<String> titles,
    selectedIndex,
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
        height: 100,
        child: Row(
          children: List.generate(icons.length - 1, (index) {
            return InkWell(
              onTap: () => CustomBottomNavBarState.changeIndex(index),
              child: Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Icon(icons[index], color: Colors.white),
                    Text(titles[index], style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

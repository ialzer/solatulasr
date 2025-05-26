import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:solatulasr/UI/bottom_navigate_bar_custom.dart';

class MainPageController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    List<NavigationBarItem> items = [
      NavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      NavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      NavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notifications',
      ),
      NavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text('This is the main page content', style: TextStyle(fontSize: 20)),
          Center(child: Text('Welcome to the Main Page!')),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items:
              items
                  .map(
                    (item) => BottomNavigationBarItem(
                      icon: item.icon,
                      label: item.label,
                      backgroundColor: Colors.blue,
                    ),
                  )
                  .toList(),
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class NavigationBarItem {
  final Icon icon;
  final String? label;

  NavigationBarItem({required this.icon, this.label});
}

class BottomNavigateBarCustomController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

class BottomNavigateBarCustom extends StatelessWidget {
  final List<NavigationBarItem> items;
  final BottomNavigateBarCustomController controller = Get.put(
    BottomNavigateBarCustomController(),
  );
  BottomNavigateBarCustom({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.changeIndex(index),
            child: Obx(
              () => Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      items[index].icon.icon,
                      color:
                          controller.currentIndex.value == index
                              ? Colors.blue
                              : Colors.grey,
                    ),
                    Text(
                      items[index].label ?? '',
                      style: TextStyle(
                        color:
                            controller.currentIndex.value == index
                                ? Colors.blue
                                : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

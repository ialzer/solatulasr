import 'package:flutter/material.dart';
import 'package:solatulasr/UI/bottom_navigate_bar_custom.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
      body: Center(child: Text('Welcome to the Main Page!')),
      bottomNavigationBar: BottomNavigateBarCustom(items: items),
    );
  }
}

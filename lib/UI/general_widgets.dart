import 'package:flutter/material.dart';
import 'package:solatulasr/UI/HomePage/home_page_widget.dart';

class GeneralWidgets extends StatelessWidget {
  const GeneralWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Replace with a solid color
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }
}

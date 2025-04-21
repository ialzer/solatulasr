import 'package:flutter/material.dart';
import 'package:solatulasr/UI/HomePage/background_widget.dart';
import 'package:solatulasr/UI/HomePage/icons_menu_widget.dart';
import 'package:solatulasr/UI/HomePage/mosque_list_widget.dart';
import 'package:solatulasr/UI/HomePage/search_widget.dart';
import 'package:solatulasr/UI/HomePage/text_widget.dart';
import 'package:solatulasr/UI/HomePage/time_widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              BackgroundWidget(),

              SearchWidget(),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      TextWidget(),
                      SizedBox(height: 20),
                      TimeWidget(),
                      SizedBox(height: 20),
                      IconsMenuWidget(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: MosqueListWidget(),
          ),
        ],
      ),
    );
  }
}

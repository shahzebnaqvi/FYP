import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:medicalapp/Views/Auth/auth_home_screen.dart';
import 'package:medicalapp/Views/Home%20Dashboard/home_screen.dart';

class BottombarController extends GetxController {
  List<Widget> screenList = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];

  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }
}

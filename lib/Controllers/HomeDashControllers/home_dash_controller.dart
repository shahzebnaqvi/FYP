import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';

class HomeDashController extends GetxController with MainController {
  var bottomNavIndex = 0.obs; //default index of a first screen
  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  togglemenu(index) {
    bottomNavIndex.value = index;
  }
}

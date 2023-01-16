import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';

class HomeController extends GetxController with MainController {
  var bottomNavIndex = 0.obs; //default index of a first screen
  TextEditingController search = TextEditingController();
  // BottombarController bottomcontroller = Get.put(BottombarController());

  togglemenu(index) {
    bottomNavIndex.value = index;
  }
}

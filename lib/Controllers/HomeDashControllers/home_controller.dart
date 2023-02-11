import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';

class HomeController extends GetxController with MainController {
  var bottomNavIndex = 0.obs; //default index of a first screen
  TextEditingController search = TextEditingController();
  // BottombarController bottomcontroller = Get.put(BottombarController());
  var colorsarray = [
    0xff299a80,
    0xff2486c7,
    0xffeb7a31,
    0xff6d58a5,
    0xff299a80,
    0xff2486c7,
    0xffeb7a31,
    0xff6d58a5,
    0xff299a80,
    0xff2486c7,
    0xffeb7a31,
    0xff6d58a5
  ];
  var categories = [
    "Family physicians",
    "Internists",
    "Emergency physicians",
    "Psychiatrists",
    "Obstetricians and gynecologists",
    "Neurologists",
    "Radiologists",
    "Anesthesiologists"
  ];
  var iconlist = [
    Icons.medical_information,
    Icons.medical_services,
    Icons.medication_liquid_sharp,
    Icons.dashboard_customize_rounded,
    Icons.medical_information,
    Icons.medication_liquid_sharp,
    Icons.medical_information,
    Icons.medical_information,
    Icons.medical_information,
    Icons.medical_information,
    Icons.medical_information,
    Icons.medical_information,
    Icons.medical_information,
    Icons.medical_information
  ];
  togglemenu(index) {
    bottomNavIndex.value = index;
  }
}

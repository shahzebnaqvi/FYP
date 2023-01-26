import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:medicalapp/Views/Auth/auth_home_screen.dart';
import 'package:medicalapp/Views/Home%20Dashboard/home_screen.dart';
import 'package:medicalapp/Views/Patient/All%20Doctors/all_doctor_screen.dart';
import 'package:medicalapp/Views/Patient/My%20Doctor%20Appointment/my_doctor_appointments.dart';
import 'package:medicalapp/Views/Profile/profile_screen.dart';

class BottombarController extends GetxController {
  List<Widget> screenList = [
    HomeScreen(),
    AllDoctorScreen(),
    MyDoctorAppointments(),
    ProfileScreen(),
    HomeScreen()
  ];

  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }
}

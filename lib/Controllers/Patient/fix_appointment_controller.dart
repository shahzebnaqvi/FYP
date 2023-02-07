import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medicalapp/Helper/storage_helper.dart';
import 'package:medicalapp/Services/constant_storage.dart';

class FixAppointmentController extends GetxController with MainController {
  dynamic argumentData = Get.arguments;
  var time =
      "${DateTime.now().hour} : ${DateTime.now().minute} ${DateTime.now().hour < 12 ? 'AM' : 'PM'}";
  TimeOfDay selectedtime = TimeOfDay(hour: 7, minute: 15);
  var date = DateTime.now();
  void onInit() {
    argumentData = Get.arguments;
    super.onInit();
  }

  selectTime(BuildContext context) async {
    var newTime = await showTimePicker(
      context: context,
      initialTime: selectedtime,
    );
    update();

    if (newTime != null) {
      selectedtime = newTime;
      time = '${selectedtime.format(context)}';
      update();
    }
  }

  selectdate(a) {
    date = a;
    update();
    print("nddncisni $date");
  }

  addappointment() async {
    await FirebaseFirestore.instance.collection('appointments').add({
      'patient_name': BaseStorage.storage.read("username"),
      'patient_email': BaseStorage.storage.read("email"),
      'patient_profile': BaseStorage.storage.read("profile"),
      'appointment_date': date,
      'appointment_time': time,
      'doctor_email': BaseStorage.storage.read("username"),
    });
  }
}

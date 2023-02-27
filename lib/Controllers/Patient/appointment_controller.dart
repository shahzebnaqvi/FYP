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

class AppointmentController extends GetxController with MainController {
  dynamic argumentData = Get.arguments;
  var time =
      "${DateTime.now().hour} : ${DateTime.now().minute} ${DateTime.now().hour < 12 ? 'AM' : 'PM'}";
  TimeOfDay selectedtime = TimeOfDay(hour: 7, minute: 15);
  var date = DateTime.now();
  var experience = '';
  var hospital = "";
  var education = '';
  var location = '';
  var info = '';
  void onInit() {
    argumentData = Get.arguments;
    print(argumentData);
    super.onInit();

    print("testing");
    print("${argumentData[1]['email']}");

    // FirebaseFirestore.instance
    //     .collection("${argumentData[1]['email']}")

    FirebaseFirestore.instance
        .collection("doctordetails")
        .doc('${argumentData[1]['email']}')
        .get()
        .then((doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        experience = data['experience'];
        hospital = data['hospital'];
        education = data['education'];
        location = data['location'];
        info = data['info'];
        update();
      }
    });
    print(info);
    update();
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
    print("adding appointment");
    await FirebaseFirestore.instance.collection('appointments').add({
      'patient_name': BaseStorage.storage.read("username"),
      'patient_email': BaseStorage.storage.read("email"),
      'patient_profile': BaseStorage.storage.read("profile"),
      'appointment_date': date,
      'appointment_time': time,
      'doctor_email': argumentData[1]['email'],
      'doctor_name': argumentData[2]['name'],
      'doctor_cat': argumentData[3]['cat'],
      'doctor_profile': argumentData[0]['imagelink']
    });
  }
}

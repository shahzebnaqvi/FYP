import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:medicalapp/Services/constant_storage.dart';

class AddReportController extends GetxController with MainController {
  TextEditingController disease = TextEditingController();
  TextEditingController discription = TextEditingController();
  dynamic argumentData = Get.arguments;

  void onInit() {
    argumentData = Get.arguments;
    print(" $argumentData");
    super.onInit();
  }

  adddoctordetails() async {
    // Get the doctor details from the text fields
    Map<String, dynamic> doctorDetails = {
      'disease': disease.text,
      'discription': discription.text,
      'doctor_name': BaseStorage.storage.read("username"),
      'doctor_email': BaseStorage.storage.read("email"),
      'patient_email': argumentData[0]['patemail'],
      'patient_name': argumentData[0]['patname'],
      'report_time': DateTime.now(),
    };

    // Save the doctor details to Firestore
    await FirebaseFirestore.instance.collection("reports").add(doctorDetails);
    disease.clear();
    discription.clear();
    Get.snackbar('Added', 'Details Added');
  }
}

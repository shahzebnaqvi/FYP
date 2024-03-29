import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medicalapp/Helper/storage_helper.dart';

class AllDoctorPatientController extends GetxController with MainController {
  var listcat = [
    "All",
    "Radiologists",
    "Neurologists",
    "Psychiatrists",
    "Pediatrician"
  ];

  var selectedcat = '';
  selectcatfunc(valuecat) {
    selectedcat = valuecat;
    if (selectedcat == "All") {
      selectedcat = '';
    }
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medicalapp/Helper/storage_helper.dart';

class AppointmentController extends GetxController with MainController {
  dynamic argumentData = Get.arguments;
  void onInit() {
    argumentData = Get.arguments;
    print(argumentData);
    super.onInit();
  }
}

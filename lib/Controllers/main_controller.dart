import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MainController on GetxController {
  backpage() {
    Get.back();
  }

  underprogess() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(20),
        titlePadding: EdgeInsets.all(20),
        title: 'Under Progess',
        content: Text("This Feature is Under Construction"));
  }

  validateNull(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required.';
    }
    final RegExp emailRegex = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }
}

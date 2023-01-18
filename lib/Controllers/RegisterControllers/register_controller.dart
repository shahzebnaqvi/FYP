import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with MainController {
  TextEditingController rfname = TextEditingController();
  TextEditingController rlname = TextEditingController();
  TextEditingController remail = TextEditingController();
  TextEditingController rcemail = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  var hidepass = true.obs;

  var checkboxval = false.obs;

  checkboxvalupdate() {
    if (checkboxval.value) {
      checkboxval.value = false;
    } else {
      checkboxval.value = true;
    }
    update();
    print(checkboxval);
  }

  hidenshowpass() {
    if (hidepass.value) {
      hidepass.value = false;
    } else {
      hidepass.value = true;
    }
    update();
    print(hidepass);
  }
}

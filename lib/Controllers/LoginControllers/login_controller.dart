import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';

class LoginController extends GetxController with MainController {
  TextEditingController semail = TextEditingController();
  TextEditingController spassword = TextEditingController();
  var hidepass = true.obs;
  var checkboxval = false.obs;
  var toggleValue = 0.obs;
  toggleButton(a) {
    print(a);
    toggleValue.value = a;
    update();
  }

  forgotpass() {
    print("object");
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

  checkboxvalupdate() {
    if (checkboxval.value) {
      checkboxval.value = false;
    } else {
      checkboxval.value = true;
    }
    update();
    print(checkboxval);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with MainController {
  TextEditingController rfname = TextEditingController();
  TextEditingController rlname = TextEditingController();
  TextEditingController remail = TextEditingController();
  TextEditingController rcemail = TextEditingController();
  TextEditingController rphone = TextEditingController();
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
}

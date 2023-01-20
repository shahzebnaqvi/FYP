import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:medicalapp/Views/Home%20Dashboard/home_dashboard_screen.dart';
import 'package:medicalapp/Views/Home%20Dashboard/home_screen.dart';

class LoginController extends GetxController with MainController {
  TextEditingController semail = TextEditingController();
  TextEditingController spassword = TextEditingController();
  var hidepass = true.obs;
  var checkboxval = false.obs;
  var toggleValue = 0.obs;
  var loading = false;
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

  Future loginuser(email, password) async {
    loading = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeDashboardScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');

        print('Wrong password provided for that user.');
      }
    }
    loading = false;
    update();
  }
}

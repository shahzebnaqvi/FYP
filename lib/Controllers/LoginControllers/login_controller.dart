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

  // signupfunction(emailAddress, password) async {
  //   if (emailAddress == '' || password == '') {
  //     Get.snackbar('Account Created', 'Fill The fields');
  //   } else {
  //     try {
  //       final credential =
  //           await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailAddress,
  //         password: password,
  //       );
  //       semail.clear();
  //       spassword.clear();
  //       Get.snackbar('Account Created', 'Account Created');

  //       // Navigator.of(context)
  //       //     .push(MaterialPageRoute(builder: (context) => Login()));
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'weak-password') {
  //         Get.snackbar('Error', 'The password provided is too weak.');
  //         print('The password provided is too weak.');
  //       } else if (e.code == 'email-already-in-use') {
  //         Get.snackbar('Error', 'The account already exists for that email.');

  //         print('The account already exists for that email.');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }
}

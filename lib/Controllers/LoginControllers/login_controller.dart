import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Views/Doctor/Home%20Dashboard/home_dashboard.dart';
import 'package:medicalapp/Views/Patient/Home%20Dashboard/home_dashboard_screen.dart';
import 'package:medicalapp/Views/Patient/Home%20Dashboard/home_screen.dart';

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
    // loading = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Future<QuerySnapshot> getUserInfo(String username) async {
        return await FirebaseFirestore.instance
            .collection("user_detail")
            .where("email", isEqualTo: username)
            .get();
      }

      CollectionReference user_detail =
          FirebaseFirestore.instance.collection("user_detail");
      var userdetails;
      await user_detail.where('email', isEqualTo: email).get().then((data) {
        userdetails = data.docs[0].data();
      }); // print("${a == null ? null : a!;
      // var currentuser = user.docs[0].data()["0"]}");

      BaseStorage.storage.write("profile", userdetails['profile']);
      BaseStorage.storage.write("type", userdetails['type']);
      BaseStorage.storage.write("email", userdetails['email']);
      BaseStorage.storage.write("username", userdetails['username']);
      BaseStorage.storage.write("uid", FirebaseAuth.instance.currentUser!.uid);
      if (BaseStorage.storage.read("type") == "Patient") {
        Get.offAll(HomeDashboardScreen());
      } else if (BaseStorage.storage.read("type") == "Doctor") {
        Get.offAll(HomeDashboardDoctor());
      } else {}
      loading = false;
      update();
      // print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
        loading = false;
        update();
        print('Wrong password provided for that user.');
      } else {
        loading = false;
        update();
        print(e);
      }
    }
    loading = false;
    update();
  }
}

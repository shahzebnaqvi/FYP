import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Views/Doctor/Home%20Dashboard/home_dashboard.dart';
import 'package:medicalapp/Views/Patient/Home%20Dashboard/home_dashboard_screen.dart';
import 'package:medicalapp/Views/Patient/Home%20Dashboard/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

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

  late String animationURL;
  Artboard? teddyArtboard;
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? numLook;

  StateMachineController? stateMachineController;
  @override
  void onInit() {
    // TODO: implement initState
    super.onInit();
    animationURL = defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? 'assets/animations/login.riv'
        : 'animations/login.riv';
    rootBundle.load(animationURL).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        stateMachineController =
            StateMachineController.fromArtboard(artboard, "Login Machine");
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);

          stateMachineController!.inputs.forEach((e) {
            debugPrint(e.runtimeType.toString());
            debugPrint("name${e.name}End");
          });

          stateMachineController!.inputs.forEach((element) {
            if (element.name == "trigSuccess") {
              successTrigger = element as SMITrigger;
            } else if (element.name == "trigFail") {
              failTrigger = element as SMITrigger;
            } else if (element.name == "isHandsUp") {
              isHandsUp = element as SMIBool;
            } else if (element.name == "isChecking") {
              isChecking = element as SMIBool;
            } else if (element.name == "numLook") {
              numLook = element as SMINumber;
            }
          });
        }

        teddyArtboard = artboard;
        update();
      },
    );
  }

  void handsOnTheEyes() {
    isHandsUp?.change(true);
  }

  void lookOnTheTextField() {
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void moveEyeBalls(val) {
    numLook?.change(val.length.toDouble());
  }
}

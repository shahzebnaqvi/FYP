import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medicalapp/Helper/storage_helper.dart';

class RegisterController extends GetxController with MainController {
  TextEditingController rfname = TextEditingController();
  TextEditingController rlname = TextEditingController();
  TextEditingController remail = TextEditingController();
  TextEditingController rcemail = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  var fielddoctor = 'Select'.obs;
  var loading = false;

  changefielddoctor(value) {
    // print("object");
    fielddoctor.value = value;
  }

  var hidepass = true.obs;
  var results;

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

  updateimg(resu) {
    results = resu;
    update();
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

  signupfunction(emailAddress, password, name, results, type, field) async {
    loading = true;
    print("object slalas");
    Storage storageobj = Storage();
    var filename = results.files.single.name;
    var pathname = results.files.single.path;
    storageobj.uploadFile(pathname, emailAddress, filename);
    if (emailAddress == '' || password == '') {
      Get.snackbar('Account Created', 'Fill The fields');
    } else {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        var url = storageobj
            .uploadFile(pathname, emailAddress, filename)
            .then((value1) async {
          await FirebaseFirestore.instance.collection("user_detail").add({
            'type': type,
            'field': field,
            'email': emailAddress,
            'username': name,
            'password': password,
            'profile': value1
            // "profile/" + emailAddress + "/" + results.files.single.name
          });
        });
        // remail.clear();
        // rpassword.clear();
        Get.snackbar('Account Created', 'Account Created');

        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => Login()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.');
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'The account already exists for that email.');

          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    loading = false;
  }

  signupfunctionPatient(emailAddress, password, name, results, type) async {
    loading = true;

    // storageobj.uploadFile(pathname, emailAddress, filename);
    if (emailAddress == '' || password == '') {
      Get.snackbar('Account Created', 'Fill The fields');
    } else {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        Storage storageobj = Storage();
        var filename = results.files.single.name;
        var pathname = results.files.single.path;
        var url = storageobj
            .uploadFile(pathname, emailAddress, filename)
            .then((value1) async {
          await FirebaseFirestore.instance.collection("user_detail").add({
            'type': type,
            'email': emailAddress,
            'username': name,
            'password': password,
            'profile': value1,
            // "profile/" + emailAddress + "/" + results.files.single.name
          });
          remail.clear();
          rpassword.clear();
          Get.snackbar('Account Created', 'Account Created');
        });

        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => Login()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.');
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'The account already exists for that email.');

          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    loading = false;
  }
}

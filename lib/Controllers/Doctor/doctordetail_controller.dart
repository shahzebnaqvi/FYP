import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:medicalapp/Controllers/main_controller.dart';
import 'package:medicalapp/Services/constant_storage.dart';

class DoctorDetailController extends GetxController with MainController {
  TextEditingController experience = TextEditingController();
  TextEditingController hospital = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController info = TextEditingController();
  @override
  void initState() {
    // Load the doctor details from Firestore when the widget is created
    FirebaseFirestore.instance
        .collection("${BaseStorage.storage.read("email")}")
        .doc('details')
        .get()
        .then((doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        experience.text = data['experience'];
        hospital.text = data['hospital'];
        education.text = data['education'];
        location.text = data['location'];
        info.text = data['info'];
      }
    });
  }

  adddoctordetails() async {
    // Get the doctor details from the text fields
    Map<String, dynamic> doctorDetails = {
      'email': BaseStorage.storage.read("email"),
      'experience': experience.text,
      'hospital': hospital.text,
      'education': education.text,
      'location': location.text,
      'info': info.text,
    };

    // Save the doctor details to Firestore
    await FirebaseFirestore.instance
        .collection("doctordetails")
        .doc("${BaseStorage.storage.read("email")}")
        .set(doctorDetails);

    FirebaseFirestore.instance
        .collection('user_detail')
        .where('email', isEqualTo: "${BaseStorage.storage.read("email")}")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        document.reference.update({'status': true});
      });
    });
  }
}

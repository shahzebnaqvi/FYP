import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Routes/routes.dart';

class SplashController extends GetxController {
  @override
  var appVersion = ''.obs;
  void onInit() async {
    super.onInit();

    Future.delayed(
      Duration(seconds: 4),
      () {
        // if (token == null) {
        //   Get.toNamed(AppRoutes.welcome);
        // } else {
        Get.offAllNamed(
          AppRoutes.onboarding,
        );
        // }
      },
    );
  }
}

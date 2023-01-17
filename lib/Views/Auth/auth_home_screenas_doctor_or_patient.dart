import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Controllers/auth_home_controller.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Views/Home%20Dashboard/home_dashboard_screen.dart';

class DoctorOrPatient extends StatelessWidget {
  DoctorOrPatient({super.key});
  AuthHomeController authhomeController = Get.put(AuthHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: ColorConstraints.white,
        image: DecorationImage(
            image: AssetImage(FileConstraints.background),
            opacity: 0.6,
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // leading: GestureDetector(
          //   onTap: () {
          //     authhomeController.backpage();
          //   },
          //   child: Icon(
          //     Icons.arrow_back_ios,
          //     color: ColorConstraints.blackcolor,
          //   ),
          // ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(HomeDashboardScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(right: 15.sp),
                child: Center(
                  child: Text(
                    "Register Later",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: ColorConstraints.secondarycolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(FileConstraints.logo1),

              // Image(
              //   image: AssetImage(FileConstraints.logo),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Custombuttonback(
                ontapaction: () {
                  Get.toNamed(AppRoutes.authhomeScreen, arguments: [
                    {"type": 'Patient'},
                  ]);
                },
                buttontext: "Patient"),
            Custombuttonback(
                ontapaction: () {
                  Get.toNamed(AppRoutes.authhomeScreen, arguments: [
                    {"type": 'Doctor'},
                  ]);
                },
                buttontext: "Doctor"),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}

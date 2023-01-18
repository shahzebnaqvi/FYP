import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Controllers/auth_home_controller.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthHomeScreen extends StatelessWidget {
  AuthHomeScreen({super.key});
  AuthHomeController authhomeController = Get.put(AuthHomeController());
  var typeargu = Get.arguments;

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
            Padding(
              padding: EdgeInsets.only(right: 15.sp),
              child: Center(
                child: Text(
                  "${typeargu[0]['type']} Panel",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorConstraints.secondarycolor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.sp,
                width: MediaQuery.of(context).size.width,
              ),
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
                  Get.toNamed(
                    AppRoutes.loginscreen,
                    arguments: {"type": typeargu[0]['type']},
                  );
                },
                buttontext: "Sign in"),
            Custombuttontrans(
                ontapaction: () {
                  Get.toNamed(
                    AppRoutes.registerscreen,
                    arguments: {"type": typeargu[0]['type']},
                  );
                },
                buttontext: "Register"),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}

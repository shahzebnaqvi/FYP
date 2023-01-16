import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Components/listtile_component_page.dart';
import 'package:medicalapp/Components/textcomponents.dart';
import 'package:medicalapp/Controllers/ProfileControllers/profile_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Views/Auth/auth_home_screen.dart';
import 'package:medicalapp/Views/Home%20Dashboard/home_dashboard_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  ProfileController profileControll = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: HeadingWidget1black(
          headingtext: "Account",
        ),
        actions: [
          GestureDetector(
            onTap: () {
              profileControll.underprogess();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12.sp),
              child: Icon(
                Icons.search,
                color: ColorConstraints.blackcolor,
              ),
            ),
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.offAll(HomeDashboardScreen());
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Row(
                  children: [
                    Textcomponent1(
                      textcomp: "Help and Support",
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  profileControll.underprogess();
                },
                child: ListTileCompPage(listtiletitle: "About Sehatgah   "),
              ),
              GestureDetector(
                  onTap: () {
                    profileControll.underprogess();
                  },
                  child: ListTileCompPage(
                      listtiletitle: "Frequently Asked Question")),
              GestureDetector(
                  onTap: () {
                    profileControll.underprogess();
                  },
                  child: ListTileCompPage(listtiletitle: "Share the App")),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(AuthHomeScreen());
                },
                child: Textcomponent3(
                  textcomp: "Sign in",
                ),
              ),
              Textcomponent2(
                textcomp: "Sehatgah",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

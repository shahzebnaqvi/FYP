import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:medicalapp/Api/video_vital_api.dart';
import 'package:medicalapp/Components/coursecontainer_wifav_widget.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Components/sliderwidget.dart';
import 'package:medicalapp/Components/textfield_widget.dart';
import 'package:medicalapp/Controllers/HomeDashControllers/home_controller.dart';
import 'package:medicalapp/Controllers/bottom_bar_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Views/AI%20Models/neo_analysis.dart';
import 'package:medicalapp/Views/AI%20Models/video_vital.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homecontrol = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.sp,
            child: SliderWidget(),
          ),
          HeadingRowhead(
            headingtext: "AI Models Prediction",
          ),
          Container(
            padding: EdgeInsets.only(top: 10.sp, bottom: 4.sp),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PredictionButton(
                    imagelink: "assets/images/microscope.png",
                    heading: "Neo Analysis",
                    OnTapbutton: () {
                      Get.to(() => NeoAnalysis());
                    }),
                PredictionButton(
                    imagelink: "assets/images/microscope.png",
                    heading: "Video Vitals",
                    OnTapbutton: () {
                      Get.to(() => VideoVitalScreen());
                    }),
                PredictionButton(
                    imagelink: "assets/images/microscope.png",
                    heading: "Brain Tumour",
                    OnTapbutton: () {})
              ],
            ),
          ),
          HeadingRowhead(
            headingtext: "Other Tools",
          ),
          HeadingRowhead(
            headingtext: "Mediciness",
          ),
          HeadingRowhead(
            headingtext: "Doctors",
          ),
        ],
      ),
    ));
  }
}

class PredictionButton extends StatelessWidget {
  final imagelink;
  final heading;
  final OnTapbutton;
  const PredictionButton(
      {super.key,
      required this.imagelink,
      required this.heading,
      required this.OnTapbutton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OnTapbutton();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: ColorConstraints.primarycolor.withOpacity(0.5),
            radius: 40.sp,
            child: Image.asset(imagelink),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            heading,
            style: TextStyle(
                color: ColorConstraints.primarycolor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

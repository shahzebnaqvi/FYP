import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:medicalapp/Api/video_vital_api.dart';
import 'package:medicalapp/Components/coursecontainer_wifav_widget.dart';
import 'package:medicalapp/Components/doctor_comp.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Components/sliderwidget.dart';
import 'package:medicalapp/Components/textfield_widget.dart';
import 'package:medicalapp/Controllers/HomeDashControllers/home_controller.dart';
import 'package:medicalapp/Controllers/bottom_bar_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
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
                    imagelink: FileConstraints.neoanalysis,
                    heading: "Neo Analysis",
                    OnTapbutton: () {
                      Get.to(() => NeoAnalysis());
                    }),
                PredictionButton(
                    imagelink: FileConstraints.videovital,
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
            headingtext: "Doctors",
          ),
          Container(
            height: 300,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('user_detail')
                    // .where("gender",)
                    .where('gender', isEqualTo: 'Doctor')

                    // .orderBy('datecreation', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text(""));
                  }
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return InkWell(
                        onTap: () {},
                        child: cardcourse(context, "${data['user_detail']}",
                            'Bill', '${data['profile']}'),
                      );
                    }).toList(),
                  );
                }),
          ),
          HeadingRowhead(
            headingtext: "Other Tools",
          ),
          HeadingRowhead(
            headingtext: "Mediciness",
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

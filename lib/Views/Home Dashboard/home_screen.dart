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
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:medicalapp/Views/AI%20Models/neo_analysis.dart';
import 'package:medicalapp/Views/AI%20Models/video_vital.dart';
import 'package:medicalapp/Views/Additionaltools/bmi.dart';
import 'package:medicalapp/Views/Additionaltools/bp.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homecontrol = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var Additionaltitle = [
      "BMI",
      "BP",
    ];
    var Additionalicon = [
      Icons.medical_services,
      Icons.bloodtype,
    ];

    var Additionalnav = [Bmi(), BP()];

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
            height: 215.sp,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('user_detail')
                    // .where("gender",)
                    .where('type', isEqualTo: 'Doctor')
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
                      return GestureDetector(
                        onTap: () {},
                        child: DoctorWidget(
                            imagelink: '${data['profile']}',
                            doctname: '${data['username']}',
                            doctcat: '${data['field']}',
                            OnTapbutton: () {
                              Get.toNamed(AppRoutes.appointmentscreen,
                                  arguments: [
                                    {"imagelink": '${data['profile']}'},
                                    {"email": '${data['email']}'},
                                    {'name': '${data['username']}'}
                                  ]);
                            }),
                      );
                    }).toList(),
                  );
                }),
          ),
          HeadingRowhead(
            headingtext: "Other Tools",
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Additionaltitle.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: MediaQuery.of(context).size.width * 0.3,
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Additionalnav[index]),
                  );
                },
                child: Container(
                    margin: EdgeInsets.all(2),
                    child: containericonsmall(context, Additionalicon[index],
                        Additionaltitle[index], Colors.white)),
              );
            },
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

class DoctorWidget extends StatelessWidget {
  final imagelink;
  final doctname;
  final doctcat;
  final OnTapbutton;
  const DoctorWidget(
      {super.key,
      required this.imagelink,
      required this.doctname,
      required this.doctcat,
      required this.OnTapbutton});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.09,
          bottom: MediaQuery.of(context).size.height * 0.020,
          left: MediaQuery.of(context).size.width * 0.030,
          right: MediaQuery.of(context).size.width * 0.010,
        ),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.060,
          left: MediaQuery.of(context).size.width * 0.040,
          bottom: MediaQuery.of(context).size.height * 0.030,
          right: MediaQuery.of(context).size.width * 0.020,
        ),
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0, color: Colors.white),
          borderRadius: BorderRadius.circular(20.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dr $doctname",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 12.0),
              child: Text(doctcat,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      Positioned(
          left: 30.sp,
          top: 10.sp,
          child: CircleAvatar(
            radius: 50.sp,
            backgroundImage: NetworkImage(imagelink),
          )),
      Positioned(
          right: 20.sp,
          top: 90.sp,
          child: GestureDetector(
            onTap: () {
              OnTapbutton();
            },
            child: Container(
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                color: ColorConstraints.secondarycolor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Text(
                "Appointment",
                style: TextStyle(color: ColorConstraints.white),
              ),
            ),
          ))
    ]);
  }
}

Widget containericonsmall(context, iconname, icontext, backgroundcolor) {
  return Container(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.04,
        left: MediaQuery.of(context).size.width * 0.03,
        bottom: MediaQuery.of(context).size.width * 0.01,
        right: MediaQuery.of(context).size.width * 0.03),
    margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.005),
    decoration: BoxDecoration(
      color: backgroundcolor,
      borderRadius: BorderRadius.all(
          Radius.circular(MediaQuery.of(context).size.width * 0.03)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    // width: MediaQuery.of(context).size.width * 0.45,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconname,
          size: MediaQuery.of(context).size.width * 0.1,
          color: ColorConstraints.primarycolor,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Text(
            icontext,
            style: TextStyle(
                color: ColorConstraints.primarycolor,
                fontSize: MediaQuery.of(context).size.width * 0.03),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'package:medicalapp/Components/doctorlist_widget.dart';

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
          Center(
            child: Container(
              padding: EdgeInsets.all(20.sp),
              height: 180.sp,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                image: DecorationImage(
                    image: AssetImage(FileConstraints.homebanner),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text(
                    "Do you feel there are \nsymptoms on your body?",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorConstraints.white),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0XffDB2B6A)),
                      onPressed: () {},
                      child: Text("Start Consultation"))
                ],
              ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 200.sp,
          //   child: SliderWidget(),
          // ),
          HeadingRowhead(
            headingtext: "Categories",
          ),
          Container(
            padding: EdgeInsets.only(top: 10.sp, bottom: 4.sp),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Categoriesbut(
                    imagelink: FileConstraints.Radiologists,
                    heading: "Radiologists",
                    OnTapbutton: () {
                      // Get.to(() => NeoAnalysis());
                    }),
                Categoriesbut(
                    imagelink: FileConstraints.Neurologists,
                    heading: "Neurologists",
                    OnTapbutton: () {
                      // Get.to(() => VideoVitalScreen());
                    }),
                Categoriesbut(
                    imagelink: FileConstraints.Psychiatrists,
                    heading: "Psychiatrists",
                    OnTapbutton: () {}),
                Categoriesbut(
                    imagelink: FileConstraints.Pediatrician,
                    heading: "Pediatrician",
                    OnTapbutton: () {})
              ],
            ),
          ),
          HeadingRowhead(
            headingtext: "Popular Doctors",
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('user_detail')
                  // .where("gender",)
                  .where('type', isEqualTo: 'Doctor')
                  .limit(3)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
          // HeadingRowhead(
          //   headingtext: "AI Models Prediction",
          // ),
          // Container(
          //   padding: EdgeInsets.only(top: 10.sp, bottom: 4.sp),
          //   width: MediaQuery.of(context).size.width * 0.9,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       PredictionButton(
          //           imagelink: FileConstraints.neoanalysis,
          //           heading: "Neo Analysis",
          //           OnTapbutton: () {
          //             Get.to(() => NeoAnalysis());
          //           }),
          //       PredictionButton(
          //           imagelink: FileConstraints.videovital,
          //           heading: "Video Vitals",
          //           OnTapbutton: () {
          //             Get.to(() => VideoVitalScreen());
          //           }),
          //       PredictionButton(
          //           imagelink: "assets/images/microscope.png",
          //           heading: "Brain Tumour",
          //           OnTapbutton: () {})
          //     ],
          //   ),
          // ),
          // HeadingRowhead(
          //   headingtext: "Other Tools",
          // ),
          // GridView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: Additionaltitle.length,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       mainAxisExtent: MediaQuery.of(context).size.width * 0.3,
          //       crossAxisCount: 4),
          //   itemBuilder: (context, index) {
          //     return InkWell(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => Additionalnav[index]),
          //         );
          //       },
          //       child: Container(
          //           margin: EdgeInsets.all(2),
          //           child: containericonsmall(context, Additionalicon[index],
          //               Additionaltitle[index], Colors.white)),
          //     );
          //   },
          // ),
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

class Categoriesbut extends StatelessWidget {
  final imagelink;
  final heading;
  final OnTapbutton;
  const Categoriesbut(
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
            backgroundColor: ColorConstraints.primary1,
            radius: 35.sp,
            child: CircleAvatar(
              backgroundColor: ColorConstraints.primarycolor,
              radius: 30.sp,
              child: Image.asset(
                imagelink,
                width: 30.sp,
              ),
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            heading,
            style: TextStyle(
                color: ColorConstraints.primary2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
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

class FieldComp extends StatelessWidget {
  final colors;
  final img;
  final text;
  FieldComp(
      {super.key, required this.colors, required this.img, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colors,
          border: Border.all(width: 0, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.050,
        ),
        width: 120,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              img,
              color: ColorConstraints.white,
              size: 40.sp,
            ),
            // Image(image: AssetImage(img)),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                text,
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ],
        ));
    ;
  }
}

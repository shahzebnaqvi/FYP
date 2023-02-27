import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:medicalapp/Views/AI%20Models/neo_analysis.dart';
import 'package:medicalapp/Views/AI%20Models/video_vital.dart';
import 'package:medicalapp/Views/Additionaltools/bmi.dart';
import 'package:medicalapp/Views/Additionaltools/bp.dart';
import 'package:medicalapp/Views/Doctor/Appointments/view_all_appointments_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicalapp/Components/doctorlist_widget.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp/Views/Patient/Home%20Dashboard/home_screen.dart';

class HomeDashboardDoctor extends StatelessWidget {
  const HomeDashboardDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Color(0xff59D5DC), Color(0xff1DC2F8)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(
              height: 40.sp,
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadingWidget1white(
                          headingtext:
                              "Hello, \nDr ${BaseStorage.storage.read("username")}"),
                      CircleAvatar(
                        radius: 30.sp,
                        backgroundImage: NetworkImage(
                            "${BaseStorage.storage.read("profile")}"),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 40.sp,
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.8,
                maxHeight: 10000,
              ),
              decoration: BoxDecoration(
                color: ColorConstraints.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.sp),
                  topRight: Radius.circular(20.sp),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  HeadingRow(
                      btntext: "View All",
                      ontapaction: () {
                        Get.to(ViewAllAppointmentScreen());
                      },
                      headingtext: "Next Appointment"),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('appointments')
                          .where('doctor_email',
                              isEqualTo: '${BaseStorage.storage.read("email")}')
                          .limit(1)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Error");
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text(""));
                        }
                        return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            return InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.myAppointmentdetaildoct,
                                      arguments: [
                                        {
                                          "imagelink": '${data['profile']}',
                                          "doctor_name":
                                              '${data['doctor_name']}',
                                          "doctor_email":
                                              '${data['doctor_email']}',
                                          "patient_email":
                                              '${data['patient_email']}',
                                          "patient_name":
                                              '${data['patient_name']}',
                                          "appointment_time":
                                              '${data['appointment_time']}',
                                          "date":
                                              '${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}',
                                        }
                                      ]);
                                },
                                child: DoctorWidgetAppointmentsHome(
                                    docttime: "${data['appointment_time']}",
                                    imagelink: "${data['patient_profile']}",
                                    doctname: "${data['patient_name']}",
                                    doctcat: '${data['doctor_cat']}',
                                    doctdate:
                                        "${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}",
                                    OnTapbutton: () {
                                      Get.toNamed(AppRoutes.myAppointmentdetail,
                                          arguments: [
                                            {
                                              "imagelink": '${data['profile']}',
                                              "doctor_name":
                                                  '${data['doctor_name']}',
                                              "doctor_email":
                                                  '${data['doctor_email']}',
                                              "patient_email":
                                                  '${data['patient_email']}',
                                              "patient_name":
                                                  '${data['patient_name']}',
                                              "appointment_time":
                                                  '${data['appointment_time']}',
                                              "date":
                                                  '${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}',
                                            }
                                          ]);
                                    }));
                          }).toList(),
                        );
                      }),
                  HeadingRowhead(
                    headingtext: "Others",
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10.sp, bottom: 4.sp),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DoctorHomeWidget(
                                imagelink: FileConstraints.bmi,
                                heading: "BMI",
                                OnTapbutton: () {
                                  Get.to(() => Bmi());
                                }),
                            DoctorHomeWidget(
                                imagelink: FileConstraints.calories,
                                heading: "Calories",
                                OnTapbutton: () {
                                  Get.to(() => BP());
                                }),
                            DoctorHomeWidget(
                                imagelink: FileConstraints.report,
                                heading: "Report",
                                OnTapbutton: () {
                                  Get.to(() => NeoAnalysis());
                                }),
                          ])),
                  HeadingRowhead(
                    headingtext: "AI Model",
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10.sp, bottom: 4.sp),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DoctorHomeWidget(
                                imagelink: FileConstraints.videovitals,
                                heading: "Video Vitals",
                                OnTapbutton: () {
                                  Get.to(() => VideoVitalScreen());
                                }),
                            DoctorHomeWidget(
                                imagelink: FileConstraints.neoanalysis1,
                                heading: "Neo Analysis",
                                OnTapbutton: () {
                                  Get.to(() => NeoAnalysis());
                                }),
                            DoctorHomeWidget(
                                imagelink: FileConstraints.ocr,
                                heading: "OCR Report",
                                OnTapbutton: () {
                                  Get.to(() => NeoAnalysis());
                                }),
                          ])),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Custombuttonbackred(
                    ontapaction: () {
                      BaseStorage.storage.erase();

                      Get.offAllNamed(
                        AppRoutes.doctororpatient,
                      );
                    },
                    buttontext: "Logout",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorHomeWidget extends StatelessWidget {
  final imagelink;
  final heading;
  final OnTapbutton;
  const DoctorHomeWidget(
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
      child: Container(
        width: 110.sp,
        padding: EdgeInsets.only(
            top: 20.sp, bottom: 20.sp, left: 10.sp, right: 10.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagelink, height: 40.sp),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              heading,
              style: TextStyle(
                  color: ColorConstraints.primarycolor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

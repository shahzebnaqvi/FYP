import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Controllers/Patient/all_doctor_patient_controller.dart';
import 'package:medicalapp/Controllers/Patient/appointment_detail_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp/Utils/file_contraints.dart';

class MyAppointmentDetailDoct extends StatelessWidget {
  MyAppointmentDetailDoct({super.key});
  AppointmentDetailController appointmentdetailControl =
      Get.put(AppointmentDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1DC2F8),
          elevation: 0,
          // automaticallyImplyLeading: false,
          title: Row(
            children: [
              HeadingWidget1white(
                headingtext: "Appointment Detail",
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorConstraints.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: GetBuilder(
            init: appointmentdetailControl,
            builder: (contexta) {
              return SingleChildScrollView(
                child: Center(
                    // allassessmentControl.assessmentdata[0]
                    child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20.sp),
                              bottomLeft: Radius.circular(20.sp)),
                          color: Color(0xff1DC2F8),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30.sp,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.sp),
                                    ),
                                    color: ColorConstraints.white,
                                  ),
                                  child: Icon(
                                    Icons.medical_information,
                                    color: Color(0xff1DC2F8),
                                    size: 50.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.sp,
                                ),
                                Text(
                                  "${appointmentdetailControl.argumentData[0]['appointment_time']}",
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorConstraints.white),
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Text(
                                  "Date: ${appointmentdetailControl.argumentData[0]['date']}",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstraints.white),
                                ),
                                Text(
                                  "Dr ${appointmentdetailControl.argumentData[0]['doctor_name']}",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstraints.white),
                                ),
                                SizedBox(
                                  height: 30.sp,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 1,
                                  color:
                                      ColorConstraints.white.withOpacity(0.4),
                                ),
                                SizedBox(
                                  height: 45.sp,
                                ),
                              ],
                            ))),
                    Container(
                      margin: EdgeInsets.only(top: 30.sp, bottom: 30.sp),
                      padding: EdgeInsets.all(20.sp),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: ColorConstraints.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.sp),
                          )),
                      child: Column(
                        children: [
                          Appointmentdetailcomp(
                              titlehead: "Patient Name:",
                              titledetail:
                                  "${appointmentdetailControl.argumentData[0]['patient_name']}"),
                          Appointmentdetailcomp(
                              titlehead: "Patient Email:",
                              titledetail:
                                  "${appointmentdetailControl.argumentData[0]['patient_email']}"),
                          Appointmentdetailcomp(
                              titlehead: "My Name:",
                              titledetail:
                                  "${appointmentdetailControl.argumentData[0]['doctor_name']}"),
                          Appointmentdetailcomp(
                              titlehead: "My Email:",
                              titledetail:
                                  "${appointmentdetailControl.argumentData[0]['doctor_email']}"),
                        ],
                      ),
                    )
                  ],
                )),
              );
            }),
        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Custombuttonbackred(
                    ontapaction: () {
                      Get.back();
                    },
                    buttontext: "Back",
                  ))
            ]));
  }
}

class Appointmentdetailcomp extends StatelessWidget {
  final titlehead;
  final titledetail;
  Appointmentdetailcomp(
      {super.key, required this.titlehead, required this.titledetail});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.sp),
            child: Text(
              titlehead,
              style: TextStyle(
                  color: ColorConstraints.blackcolor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.sp),
            child: Text(
              titledetail,
              style: TextStyle(
                  color: ColorConstraints.blackcolor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            color: ColorConstraints.greyshade,
            height: 1.sp,
            width: MediaQuery.of(context).size.width,
          )
        ]);
  }
}

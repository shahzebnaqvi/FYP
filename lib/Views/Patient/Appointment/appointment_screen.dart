import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/Patient/appointment_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Views/Patient/Appointment/appointment_comp.dart';
import 'package:medicalapp/Views/Patient/Appointment/fix_appointment_screen.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});
  AppointmentController appointmentControl = Get.put(AppointmentController());
  var one = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(appointmentControl
                                .argumentData[0]['imagelink']),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20.sp),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: ColorConstraints.white,
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstraints.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.sp),
                            topRight: Radius.circular(40.sp)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 60.sp,
                    ),
                  ),
                  Positioned(
                    right: 30.sp,
                    left: 30.sp,
                    bottom: 20.sp,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            // to make elevation
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                          color: ColorConstraints.secondarycolor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.sp),
                            topRight: Radius.circular(50.sp),
                            bottomLeft: Radius.circular(50.sp),
                            bottomRight: Radius.circular(50.sp),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 90.sp,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Dr shahzeb",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w900,
                                  color: ColorConstraints.white,
                                ),
                              ),
                              Text(
                                "Dr shahzeb",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstraints.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: ColorConstraints.primarycolor,
                      ),
                    ),
                    Text(
                      "lofrem asnia ndaiiaiajsa iasjisjiiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasij",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorConstraints.primarycolor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DoctorFeatures(
                            featuretext: "Patient",
                            featureicon: "400",
                            featurecolor: ColorConstraints.secondarycolor),
                        DoctorFeatures(
                            featuretext: "Year Exp",
                            featureicon: "4",
                            featurecolor: ColorConstraints.secondarycolor),
                        DoctorFeatures(
                            featuretext: "Rating",
                            featureicon: "6",
                            featurecolor: ColorConstraints.secondarycolor),
                        DoctorFeatures(
                            featuretext: "Rating",
                            featureicon: "6",
                            featurecolor: ColorConstraints.secondarycolor),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 10.sp,
          bottom: 10.sp,
          right: 10.sp,
          left: 10.sp,
        ),
        decoration: BoxDecoration(
          color: ColorConstraints.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Rs 3000",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w900,
                color: ColorConstraints.primarycolor,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(FixAppointment(), arguments: [
                    {
                      'profileimagedocts':
                          '${appointmentControl.argumentData[0]['imagelink']}'
                    }
                  ]);
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorConstraints.primarycolor,
                ),
                child: Text("Fix Appointment"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
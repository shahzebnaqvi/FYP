import 'dart:ui';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Controllers/Patient/appointment_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:medicalapp/Views/Patient/Appointment/appointment_comp.dart';
import 'package:medicalapp/Views/Patient/Appointment/fix_appointment_screen.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});
  AppointmentController appointmentControl = Get.put(AppointmentController());
  var one = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Profile Doctor"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorConstraints.primarycolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.sp,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        radius: 50.sp,
                        backgroundImage: NetworkImage(
                            appointmentControl.argumentData[0]['imagelink'])),
                    title: Text(
                      "Dr ${appointmentControl.argumentData[2]['name']}",
                      style: TextStyle(
                          color: ColorConstraints.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "${appointmentControl.argumentData[3]['cat']}",
                      style: TextStyle(
                          color: ColorConstraints.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.sp,
                    ),
                    Text(
                      "Info",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: ColorConstraints.primarycolor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        icontext(FileConstraints.myappointment, "4 Years"),
                        icontext(FileConstraints.myappointment, "cleve Clinic")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        icontext(
                            FileConstraints.myappointment, "Havard University"),
                        icontext(FileConstraints.myappointment, "USA")
                      ],
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      "Overview",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: ColorConstraints.primarycolor,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      "lofrem asnia ndaiiaiajsa frem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasijlofrem asnia ndaiiaiajsa iasjisji iasij",
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorConstraints.primarycolor,
                      ),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Text(
                      "Schedule",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: ColorConstraints.primarycolor,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    CalendarTimeline(
                      initialDate: appointmentControl.date,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2024),
                      onDateSelected: (date) => appointmentControl.date = date
                      // fixappointmentControl.update();
                      ,
                      leftMargin: 20,
                      monthColor: Colors.blueGrey,
                      dayColor: ColorConstraints.secondarycolor,
                      activeDayColor: Colors.white,
                      activeBackgroundDayColor: ColorConstraints.secondarycolor,
                      dotsColor: Color(0xFF333A47),
                      selectableDayPredicate: (date) {
                        // fixappointmentControl.selectdate(date);

                        return date.day != 23;
                      },
                      locale: 'en_ISO',
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          appointmentControl.selectTime(context);
                        },
                        child: Text(
                          "${appointmentControl.time}",
                          style: TextStyle(
                            fontSize: 26.sp,
                            color: ColorConstraints.primarycolor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Custombuttonback(
                        ontapaction: () async {
                          appointmentControl.addappointment().then((v) {
                            Get.defaultDialog(
                                title: "Appointment Fixed",
                                middleText: "Check My Appointment");
                          });
                        },
                        buttontext: "Fix Appointment"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.only(
      //     top: 10.sp,
      //     bottom: 10.sp,
      //     right: 10.sp,
      //     left: 10.sp,
      //   ),
      //   decoration: BoxDecoration(
      //     color: ColorConstraints.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.3),
      //         spreadRadius: 5,
      //         blurRadius: 7,
      //         offset: Offset(0, 3), // changes position of shadow
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     // mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 8.0),
      //         child: Text(
      //           "Rs 3000",
      //           style: TextStyle(
      //             fontSize: 22.sp,
      //             fontWeight: FontWeight.w900,
      //             color: ColorConstraints.primarycolor,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         width: MediaQuery.of(context).size.width * 0.45,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Get.toNamed(AppRoutes.fixappointment, arguments: [
      //               {
      //                 'profileimagedocts':
      //                     '${appointmentControl.argumentData[0]['imagelink']}'
      //               },
      //               {
      //                 'doctemail':
      //                     '${appointmentControl.argumentData[1]['email']}'
      //               },
      //               {
      //                 'doctname':
      //                     '${appointmentControl.argumentData[2]['name']}'
      //               }
      //             ]);
      //           },
      //           style: ElevatedButton.styleFrom(
      //             primary: ColorConstraints.primarycolor,
      //           ),
      //           child: Text("Fix Appointment"),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

Widget icontext(iconname, textname) {
  return Row(
    children: [
      Image.asset(iconname),
      SizedBox(
        width: 5.sp,
      ),
      Text(textname)
    ],
  );
}

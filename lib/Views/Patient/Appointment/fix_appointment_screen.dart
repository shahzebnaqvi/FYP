import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Controllers/Patient/fix_appointment_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FixAppointment extends StatelessWidget {
  FixAppointment({super.key});
  FixAppointmentController fixappointmentControl =
      Get.put(FixAppointmentController());

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Schedule'),
        backgroundColor: ColorConstraints.primarycolor,
      ),
      body: GetBuilder(
          init: fixappointmentControl,
          builder: (context1) {
            return Column(
              children: [
                SizedBox(
                  height: 10.sp,
                ),
                CircleAvatar(
                  radius: 50.sp,
                  // backgroundImage: NetworkImage(
                  //   data[0]['profileimagedocts'],
                  // ),
                ),
                Text(
                  "Dr shahzeb",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w900,
                    color: ColorConstraints.secondarycolor,
                  ),
                ),
                Text(
                  "Dr shahzeb",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorConstraints.secondarycolor,
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Text(
                  "Schedule",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorConstraints.primarycolor,
                  ),
                ),
                CalendarTimeline(
                  initialDate: fixappointmentControl.date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2024),
                  onDateSelected: (date) => fixappointmentControl.date = date
                  // fixappointmentControl.update();
                  ,
                  leftMargin: 20,
                  monthColor: Colors.blueGrey,
                  dayColor: ColorConstraints.secondarycolor,
                  activeDayColor: Colors.white,
                  activeBackgroundDayColor: ColorConstraints.primarycolor,
                  dotsColor: Color(0xFF333A47),
                  selectableDayPredicate: (date) {
                    // fixappointmentControl.selectdate(date);

                    return date.day != 23;
                  },
                  locale: 'en_ISO',
                ),
                SizedBox(
                  height: 10.sp,
                ),
                GestureDetector(
                  onTap: () async {
                    print(data);

                    fixappointmentControl.selectTime(context);
                  },
                  child: Text(
                    "${fixappointmentControl.time}",
                    style: TextStyle(
                      fontSize: 36.sp,
                      color: ColorConstraints.primarycolor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            );
          }),
      bottomNavigationBar: Container(
        child: Custombuttonback(
            ontapaction: () async {
              fixappointmentControl.addappointment().then((v) {
                Get.defaultDialog(
                    title: "Appointment Fixed",
                    middleText: "Check My Appointment");
              });
            },
            buttontext: "Fix Appointment"),
      ),
    );
  }
}

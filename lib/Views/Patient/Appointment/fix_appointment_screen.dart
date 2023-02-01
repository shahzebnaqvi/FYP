import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixAppointment extends StatelessWidget {
  FixAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Schedule'),
        backgroundColor: ColorConstraints.primarycolor,
      ),
      body: Column(
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
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2024),
            onDateSelected: (date) {},
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: ColorConstraints.secondarycolor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: ColorConstraints.primarycolor,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
          SizedBox(
            height: 10.sp,
          ),
          GestureDetector(
            onTap: () async {
              print(data);

              Future _selectTime(BuildContext context) {
                return showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              }

              _selectTime(context);
            },
            child: Text(
              "${DateTime.now().hour} : ${DateTime.now().minute} ${DateTime.now().hour < 12 ? 'AM' : 'PM'}",
              style: TextStyle(
                fontSize: 36.sp,
                color: ColorConstraints.primarycolor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child:
            Custombuttonback(ontapaction: () {}, buttontext: "Fix Appointment"),
      ),
    );
  }
}

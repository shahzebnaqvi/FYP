import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Views/Doctor/Appointments/view_all_appointments_screen.dart';

class HomeDashboardDoctor extends StatelessWidget {
  const HomeDashboardDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraints.primarycolor,
      body: ListView(
        children: [
          SizedBox(
            height: 30.sp,
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
            height: 30.sp,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

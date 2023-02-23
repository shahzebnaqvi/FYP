import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Views/Doctor/Appointments/view_all_appointments_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/doctorlist_widget.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:intl/intl.dart';

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
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('appointments')
                  .where('doctor_email',
                      isEqualTo: '${BaseStorage.storage.read("email")}')
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
                    return InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.myAppointmentdetail,
                              arguments: [
                                {
                                  "imagelink": '${data['profile']}',
                                  "doctor_name": '${data['doctor_name']}',
                                  "doctor_email": '${data['doctor_email']}',
                                  "patient_email": '${data['patient_email']}',
                                  "patient_name": '${data['patient_name']}',
                                  "appointment_time":
                                      '${data['appointment_time']}',
                                  "date":
                                      '${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}',
                                }
                              ]);
                        },
                        child: DoctorWidgetAppointments(
                            imagelink: "${data['doctor_profile']}",
                            doctname: "${data['doctor_name']}",
                            doctcat: '${data['doctor_cat']}',
                            doctdate:
                                "${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}",
                            OnTapbutton: () {
                              Get.toNamed(AppRoutes.myAppointmentdetail,
                                  arguments: [
                                    {
                                      "imagelink": '${data['profile']}',
                                      "doctor_name": '${data['doctor_name']}',
                                      "doctor_email": '${data['doctor_email']}',
                                      "patient_email":
                                          '${data['patient_email']}',
                                      "patient_name": '${data['patient_name']}',
                                      "appointment_time":
                                          '${data['appointment_time']}',
                                      "date":
                                          '${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}',
                                    }
                                  ]);
                            })
                        //  Appointmentlistcomp(
                        //     imagelink: '${data['profile']}',
                        //     doctname: '${data['doctor_name']}',
                        //     doctcat: '${data['appointment_time']}',
                        //     date:
                        //         '${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}'),
                        );
                  }).toList(),
                );
              })
        ],
      ),
    );
  }
}

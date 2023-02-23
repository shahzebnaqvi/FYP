import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/doctorlist_widget.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Controllers/Patient/all_doctor_patient_controller.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:intl/intl.dart';

class MyDoctorAppointments extends StatelessWidget {
  MyDoctorAppointments({super.key});
  AllDoctorPatientController allDoctorPatientControl =
      Get.put(AllDoctorPatientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: GetBuilder(
              init: allDoctorPatientControl,
              builder: (contexta) {
                return ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15.sp, bottom: 20.sp),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50.sp,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Custombuttonbacknopad(
                              ontapaction: () {},
                              buttontext: "Upcoming",
                            ),
                          ),
                          Container(
                            height: 50.sp,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Custombuttonbacknopad(
                              ontapaction: () {},
                              buttontext: "Post",
                            ),
                          )
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('appointments')
                            .where('patient_email',
                                isEqualTo:
                                    '${BaseStorage.storage.read("email")}')
                            // .orderBy('datecreation', descending: true)
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
                                  },
                                  child: DoctorWidgetAppointments(
                                      imagelink: "${data['doctor_profile']}",
                                      doctname: "${data['doctor_name']}",
                                      doctcat: '${data['doctor_cat']}',
                                      doctdate:
                                          "${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}",
                                      OnTapbutton: () {
                                        Get.toNamed(
                                            AppRoutes.myAppointmentdetail,
                                            arguments: [
                                              {
                                                "imagelink":
                                                    '${data['profile']}',
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
                        }),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class Appointmentlistcomp extends StatelessWidget {
  final imagelink;
  final doctname;
  final doctcat;
  final date;
  const Appointmentlistcomp(
      {super.key,
      required this.imagelink,
      required this.doctname,
      required this.doctcat,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15.sp,
        // bottom: MediaQuery.of(context).size.height * 0.020,
        left: 10.sp,
        right: 10.sp,
      ),
      padding: EdgeInsets.only(
        top: 10.sp,
        bottom: 10.sp,
        right: 10.sp,
        left: 10.sp,
      ),
      width: MediaQuery.of(context).size.width * .92,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dr $doctname",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12.0),
                child: Text(doctcat,
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12.0),
                child: Text(date,
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

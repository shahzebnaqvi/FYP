import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Controllers/Patient/all_doctor_patient_controller.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Components/doctorlist_widget.dart';

class AllDoctorScreen extends StatelessWidget {
  AllDoctorScreen({super.key});
  AllDoctorPatientController allDoctorPatientControl =
      Get.put(AllDoctorPatientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GetBuilder(
          init: allDoctorPatientControl,
          builder: (contexta) {
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: HeadingRowhead(
                    headingtext: "Doctors",
                  ),
                ),
                Container(
                  height: 60.sp,
                  child: ListView.builder(
                      itemCount: allDoctorPatientControl.listcat.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => GestureDetector(
                            onTap: () {
                              allDoctorPatientControl.selectcatfunc(
                                  "${allDoctorPatientControl.listcat[index]}");
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.sp),
                              margin: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                color: "${allDoctorPatientControl.listcat[index]}" ==
                                        "${allDoctorPatientControl.selectedcat}"
                                    ? ColorConstraints.primarycolor
                                    : ColorConstraints.secondarycolor,
                                border:
                                    Border.all(width: 0, color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.03),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Text(
                                "${allDoctorPatientControl.listcat[index]}",
                                style: TextStyle(
                                  color: ColorConstraints.white,
                                ),
                              ),
                            ),
                          ))),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: "${allDoctorPatientControl.selectedcat}" == ''
                        ? FirebaseFirestore.instance
                            .collection('user_detail')
                            // .where("gender",)
                            .where('type', isEqualTo: 'Doctor')

                            // .orderBy('datecreation', descending: true)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection('user_detail')
                            // .where("gender",)
                            .where('type', isEqualTo: 'Doctor')
                            .where('field',
                                isEqualTo:
                                    "${allDoctorPatientControl.selectedcat}")
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
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return InkWell(
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
              ],
            );
          }),
    );
  }
}

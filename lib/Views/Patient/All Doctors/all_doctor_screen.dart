import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Controllers/Patient/all_doctor_patient_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

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
                                OnTapbutton: () {}),
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

class DoctorWidget extends StatelessWidget {
  final imagelink;
  final doctname;
  final doctcat;
  final OnTapbutton;
  const DoctorWidget(
      {super.key,
      required this.imagelink,
      required this.doctname,
      required this.doctcat,
      required this.OnTapbutton});

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
          CircleAvatar(
            radius: 40.sp,
            backgroundImage: NetworkImage(imagelink),
          ),
          SizedBox(
            width: 10.sp,
          ),
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
            ],
          ),
        ],
      ),
    );
  }
}

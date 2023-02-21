import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Controllers/Patient/all_doctor_patient_controller.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Components/doctorlist_widget.dart';

class AllDoctorScreen extends StatelessWidget {
  AllDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllDoctorPatientController allDoctorPatientControl =
        Get.put(AllDoctorPatientController());

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
                    headingtext: "Consult Doctor",
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
                              decoration:
                                  "${allDoctorPatientControl.listcat[index]}" ==
                                          "${allDoctorPatientControl.selectedcat}"
                                      ? BoxDecoration(
                                          color: ColorConstraints.primarycolor,
                                          border: Border.all(
                                              width: 0, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.03),
                                              spreadRadius: 5,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        )
                                      : BoxDecoration(
                                          color: ColorConstraints.white,
                                          border: Border.all(
                                              width: 0,
                                              color: ColorConstraints.primary2),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.03),
                                              spreadRadius: 5,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                              child: Text(
                                "${allDoctorPatientControl.listcat[index]}",
                                style: "${allDoctorPatientControl.listcat[index]}" ==
                                        "${allDoctorPatientControl.selectedcat}"
                                    ? TextStyle(
                                        color: ColorConstraints.white,
                                      )
                                    : TextStyle(
                                        color: ColorConstraints.primary2,
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
                            child: AllDoctorWidget(
                                imagelink: '${data['profile']}',
                                doctname: '${data['username']}',
                                doctcat: '${data['field']}',
                                OnTapbutton: () {
                                  showModalBottomSheet(
                                      backgroundColor:
                                          ColorConstraints.primary1,
                                      isScrollControlled: true,
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30.sp)),
                                      ),
                                      builder: (BuildContext bc) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Padding(
                                            padding: EdgeInsets.all(20.sp),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 5.sp,
                                                  width: 51.sp,
                                                  decoration: BoxDecoration(
                                                    color: ColorConstraints
                                                        .greyshade,
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            topRight: Radius
                                                                .circular(40.0),
                                                            bottomRight: Radius
                                                                .circular(40.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    40.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    40.0)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15.sp,
                                                ),
                                                ListTile(
                                                  dense: true,
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  minLeadingWidth: 10,
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                      '${data['profile']}',
                                                    ),
                                                    radius: 50,
                                                    // radius: 100.sp,
                                                  ),
                                                  title: Text(
                                                      "Dr ${data['username']}",
                                                      style: TextStyle(
                                                          color:
                                                              ColorConstraints
                                                                  .primary2,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  subtitle: Text(
                                                      '${data['field']}',
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff7F8E9D),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 15.sp,
                                                ),
                                                Text(
                                                    'Doctor Ruslan is an expert in skin and other Doctor Ruslan is an expert in skin and other Doctor Ruslan is an expert in skin and other',
                                                    style: TextStyle(
                                                      height: 1.5.sp,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff7F8E9D),
                                                    )),
                                                SizedBox(
                                                  height: 25.sp,
                                                ),
                                                Container(
                                                  // padding: EdgeInsets.only(
                                                  //     bottom: 12.sp, left: 12.sp, right: 6.sp),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  // 0.8,

                                                  child: Custombuttonbacknopad(
                                                      ontapaction: () {
                                                        Get.toNamed(
                                                            AppRoutes
                                                                .appointmentscreen,
                                                            arguments: [
                                                              {
                                                                "imagelink":
                                                                    '${data['profile']}'
                                                              },
                                                              {
                                                                "email":
                                                                    '${data['email']}'
                                                              },
                                                              {
                                                                'name':
                                                                    '${data['username']}'
                                                              },
                                                              {
                                                                'cat':
                                                                    '${data['field']}'
                                                              }
                                                            ]);
                                                      },
                                                      buttontext:
                                                          "See Availability"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
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

class AllDoctorWidget extends StatelessWidget {
  final imagelink;
  final doctname;
  final doctcat;
  final OnTapbutton;
  const AllDoctorWidget(
      {super.key,
      required this.imagelink,
      required this.doctname,
      required this.doctcat,
      required this.OnTapbutton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          OnTapbutton();
        },
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          minLeadingWidth: 10,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              imagelink,
            ),
            radius: 50,
            // radius: 100.sp,
          ),
          title: Text("Dr $doctname",
              style: TextStyle(
                  color: ColorConstraints.primary2,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold)),
          subtitle: Text(doctcat,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConstraints.greylight)),
          trailing: Container(
            padding: EdgeInsets.all(10.sp),
            margin: EdgeInsets.only(right: 10.sp),
            decoration: BoxDecoration(
              border:
                  Border.all(color: ColorConstraints.greylight, width: 1.sp),
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            ),
            child: Icon(
              Icons.message_sharp,
              color: ColorConstraints.primarycolor,
            ),
          ),
        ));
  }
}

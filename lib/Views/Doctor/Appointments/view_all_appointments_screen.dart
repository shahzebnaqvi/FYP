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
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/doctorlist_widget.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Controllers/Patient/all_doctor_patient_controller.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:intl/intl.dart';

class ViewAllAppointmentScreen extends StatelessWidget {
  const ViewAllAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1DC2F8),
        title: Text("Appointments"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('appointments')
              .where('doctor_email',
                  isEqualTo: '${BaseStorage.storage.read("email")}')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text(""));
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.myAppointmentdetail, arguments: [
                        {
                          "imagelink": '${data['profile']}',
                          "doctor_name": '${data['doctor_name']}',
                          "doctor_email": '${data['doctor_email']}',
                          "patient_email": '${data['patient_email']}',
                          "patient_name": '${data['patient_name']}',
                          "appointment_time": '${data['appointment_time']}',
                          "date":
                              '${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}',
                        }
                      ]);
                    },
                    child: DoctorWidgetAppointmentsHome(
                        docttime: "${data['appointment_time']}",
                        imagelink: "${data['patient_profile']}",
                        doctname: "${data['patient_name']}",
                        doctcat: '${data['doctor_cat']}',
                        doctdate:
                            "${DateFormat('d MMM yyyy').format(DateTime.parse(data['appointment_date'].toDate().toString()))}",
                        OnTapbutton: () {
                          Get.toNamed(AppRoutes.myAppointmentdetaildoct,
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
    );
  }
}

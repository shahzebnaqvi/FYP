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
import 'package:medicalapp/Utils/file_contraints.dart';

class ViewAllReportsPatientScreen extends StatelessWidget {
  const ViewAllReportsPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstraints.primarycolor,
        title: Text("Reports"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('reports')
              .where('patient_email',
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
                return ReportsWidget(
                  doctname: "${data['doctor_name']}",
                  doctemail: '${data['doctor_email']}',
                  discription: '${data['discription']}',
                  disease: '${data['disease']}',
                  doctdate:
                      "${DateFormat('d MMM yyyy').format(DateTime.parse(data['report_time'].toDate().toString()))}",
                );
              }).toList(),
            );
          }),
    );
  }
}

class ReportsWidget extends StatelessWidget {
  final doctname;
  final doctemail;
  final doctdate;
  final discription;
  final disease;
  const ReportsWidget(
      {super.key,
      required this.doctname,
      required this.doctemail,
      required this.doctdate,
      required this.discription,
      required this.disease});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 10.sp, right: 10.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(
        top: 15.sp,
        // bottom: MediaQuery.of(context).size.height * 0.020,
        left: 10.sp,
        right: 10.sp,
      ),
      width: MediaQuery.of(context).size.width * .92,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$doctname",
                        style: TextStyle(
                            color: ColorConstraints.primary2,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold)),
                    Text(doctemail,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff687DA2))),
                  ],
                ),
              ),
              Text(
                "$doctdate",
                style: TextStyle(color: Color(0xff828586)),
              ),
            ],
          ),
          SizedBox(
            height: 5.sp,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                top: 10.sp, bottom: 10.sp, left: 10.sp, right: 10.sp),
            decoration: BoxDecoration(
              color: Color(0xffF4F8FA),
              borderRadius: BorderRadius.all(
                Radius.circular(5.sp),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Disease",
                  style: TextStyle(
                      color: Color(0xff828586), fontWeight: FontWeight.w600),
                ),
                Text(
                  "$disease",
                  style: TextStyle(color: Color(0xff828586)),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      color: Color(0xff828586), fontWeight: FontWeight.w600),
                ),
                Text(
                  "$discription",
                  style: TextStyle(color: Color(0xff828586)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
        ],
      ),
    );
  }
}

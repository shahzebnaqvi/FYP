import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:medicalapp/Views/AI%20Models/neo_analysis.dart';
import 'package:medicalapp/Views/AI%20Models/video_vital.dart';
import 'package:medicalapp/Views/Additionaltools/bmi.dart';
import 'package:medicalapp/Views/Additionaltools/bp.dart';
import 'package:medicalapp/Views/Doctor/Home%20Dashboard/home_dashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Views/Patient/Report%20Patients/viewall_report_patients.dart';

class ExtrasScreen extends StatelessWidget {
  const ExtrasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              HeadingRowhead(
                headingtext: "Others",
              ),
              Container(
                  padding: EdgeInsets.only(top: 10.sp, bottom: 4.sp),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DoctorHomeWidget(
                            imagelink: FileConstraints.bmi,
                            heading: "BMI",
                            OnTapbutton: () {
                              Get.to(() => Bmi());
                            }),
                        DoctorHomeWidget(
                            imagelink: FileConstraints.calories,
                            heading: "Calories",
                            OnTapbutton: () {
                              Get.to(() => BP());
                            }),
                        DoctorHomeWidget(
                            imagelink: FileConstraints.report,
                            heading: "Report",
                            OnTapbutton: () {
                              Get.to(() => ViewAllReportsPatientScreen());
                            }),
                      ])),
              HeadingRowhead(
                headingtext: "AI Model",
              ),
              Container(
                  padding: EdgeInsets.only(top: 10.sp, bottom: 4.sp),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DoctorHomeWidget(
                            imagelink: FileConstraints.videovitals,
                            heading: "Video Vitals",
                            OnTapbutton: () {
                              Get.to(() => VideoVitalScreen());
                            }),
                        DoctorHomeWidget(
                            imagelink: FileConstraints.neoanalysis1,
                            heading: "Neo Analysis",
                            OnTapbutton: () {
                              Get.to(() => NeoAnalysis());
                            }),
                        DoctorHomeWidget(
                            imagelink: FileConstraints.ocr,
                            heading: "OCR Report",
                            OnTapbutton: () {
                              Get.to(() => NeoAnalysis());
                            }),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}

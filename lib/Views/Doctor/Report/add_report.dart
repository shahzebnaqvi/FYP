import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/labels_widget.dart';
import 'package:medicalapp/Components/textfield_widget.dart';
import 'package:medicalapp/Controllers/Doctor/add_report_controller.dart';
import 'package:medicalapp/Controllers/Doctor/doctordetail_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReportScreen extends StatelessWidget {
  AddReportScreen({super.key});

  final formKeydoctordetail = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddReportController doctorDetailControl = Get.put(AddReportController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Report Detail"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Form(
              key: formKeydoctordetail,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelWidget(
                    labeltext: "Disease*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          doctorDetailControl.validateNull(validate_value),
                      controllertextfield: doctorDetailControl.disease,
                      hinttextfield: "Enter Disease"),
                  LabelWidget(
                    labeltext: "Discription*",
                  ),
                  TextFieldWidgettextarea(
                      validationfunction: (validate_value) =>
                          doctorDetailControl.validateNull(validate_value),
                      controllertextfield: doctorDetailControl.discription,
                      hinttextfield: "Enter Discription"),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Custombuttonbackred(
                    ontapaction: () {
                      if (formKeydoctordetail.currentState!.validate()) {
                        doctorDetailControl.adddoctordetails();
                      }
                    },
                    buttontext: "Add Report",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

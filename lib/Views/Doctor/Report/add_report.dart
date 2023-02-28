import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/labels_widget.dart';
import 'package:medicalapp/Components/textfield_widget.dart';
import 'package:medicalapp/Controllers/Doctor/doctordetail_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReportScreen extends StatelessWidget {
  AddReportScreen({super.key});

  final formKeydoctordetail = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DoctorDetailController doctorDetailControl =
        Get.put(DoctorDetailController());
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
                    labeltext: "Year of Experience*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          doctorDetailControl.validateNull(validate_value),
                      controllertextfield: doctorDetailControl.experience,
                      hinttextfield: "Year of Experience"),
                  LabelWidget(
                    labeltext: "Hospital you are working in*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          doctorDetailControl.validateNull(validate_value),
                      controllertextfield: doctorDetailControl.hospital,
                      hinttextfield: "Hospital you are working in"),
                  LabelWidget(
                    labeltext: "University*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          doctorDetailControl.validateNull(validate_value),
                      controllertextfield: doctorDetailControl.education,
                      hinttextfield: "Enter your university"),
                  LabelWidget(
                    labeltext: "Location*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          doctorDetailControl.validateNull(validate_value),
                      controllertextfield: doctorDetailControl.location,
                      hinttextfield: "Enter your location"),
                  LabelWidget(
                    labeltext: "Info*",
                  ),
                  TextFieldWidgettextarea(
                      validationfunction: (validate_value) =>
                          doctorDetailControl.validateNull(validate_value),
                      controllertextfield: doctorDetailControl.info,
                      hinttextfield: "Enter your info"),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Custombuttonbackred(
                    ontapaction: () {
                      if (formKeydoctordetail.currentState!.validate()) {
                        doctorDetailControl.adddoctordetails();
                      }
                    },
                    buttontext: "Add",
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

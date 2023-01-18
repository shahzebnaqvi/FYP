import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Components/labels_widget.dart';
import 'package:medicalapp/Components/paragraph_widget.dart';
import 'package:medicalapp/Components/richtext_widget.dart';
import 'package:medicalapp/Components/textfield_widget.dart';
import 'package:medicalapp/Controllers/RegisterControllers/register_controller.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  RegisterController registerController = Get.put(RegisterController());
  final registerForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            registerController.backpage();
            // print("object");
            // Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorConstraints.blackcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Form(
              key: registerForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingWidget1(headingtext: "Register to your account"),
                  LabelWidget(
                    labeltext: "First Name*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          registerController.validateNull(validate_value),
                      controllertextfield: registerController.rfname,
                      hinttextfield: "Enter your first name"),
                  LabelWidget(
                    labeltext: "Last Name*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          registerController.validateNull(validate_value),
                      controllertextfield: registerController.rlname,
                      hinttextfield: "Enter your last name"),
                  LabelWidget(
                    labeltext: "Email*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          registerController.validateEmail(validate_value),
                      controllertextfield: registerController.remail,
                      hinttextfield: "Enter your email"),
                  LabelWidget(
                    labeltext: "Password*",
                  ),
                  Obx(
                    () => TextFieldWidgetobs(
                        validationfunction: (validate_value) =>
                            registerController.validateNull(validate_value),
                        controllertextfield: registerController.rpassword,
                        hinttextfield: "Enter your Password",
                        isHidden: registerController.hidepass.value,
                        togglePasswordView: registerController.hidenshowpass),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => CheckboxListTile(
                      checkColor: ColorConstraints.white,
                      contentPadding: EdgeInsets.all(0),
                      title: RichtextWidget(
                          text1: "I acknowledge and agree to the terms.\nSee ",
                          text2: "Terms & Conditions",
                          text1color: ColorConstraints.blackcolor,
                          text2color: ColorConstraints.secondarycolor,
                          text1font: 12.sp,
                          text2font: 12.sp),

                      value: registerController.checkboxval.value,
                      activeColor: ColorConstraints.primarycolor,
                      onChanged: (newValue) {
                        registerController.checkboxvalupdate();
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Custombuttonbacknopad(
                      ontapaction: () {
                        if (registerForm.currentState!.validate()) {
                          registerController.signupfunction(
                              registerController.remail.text,
                              registerController.rpassword.text);
                        }
                      },
                      buttontext: "Register"),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

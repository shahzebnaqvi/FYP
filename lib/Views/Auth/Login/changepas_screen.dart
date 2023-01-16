import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Components/labels_widget.dart';
import 'package:medicalapp/Components/textfield_widget.dart';
import 'package:medicalapp/Controllers/LoginControllers/changepass_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class ChangePassScreen extends StatelessWidget {
  ChangePassScreen({super.key});
  ChangepassController changepasscontroller = Get.put(ChangepassController());
  @override
  final changepassform = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            changepasscontroller.backpage();
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
              key: changepassform,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingWidget1(headingtext: "Change password?"),
                  LabelWidget(
                    labeltext: "Enter New Password*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          changepasscontroller.validateNull(validate_value),
                      controllertextfield: changepasscontroller.cppass,
                      hinttextfield: "Enter Password"),
                  LabelWidget(
                    labeltext: "Confirm Password*",
                  ),
                  TextFieldWidget(
                      validationfunction: (validate_value) =>
                          changepasscontroller.validateNull(validate_value),
                      controllertextfield: changepasscontroller.cpcpass,
                      hinttextfield: "Confirm Password"),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Custombuttonback(
              ontapaction: () {
                // Get.offAllNamed(
                //   AppRoutes.onboarding,
                // );
                if (changepassform.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  changepasscontroller.underprogess();
                }
              },
              buttontext: "Save Changes"),
          Custombuttontrans(
              ontapaction: () {
                // Get.offAllNamed(
                //   AppRoutes.loginscreen,
                // );
                Get.back();
              },
              buttontext: "Cancel"),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }
}

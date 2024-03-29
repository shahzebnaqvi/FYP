import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Components/labels_widget.dart';
import 'package:medicalapp/Components/textfield_widget.dart';
import 'package:medicalapp/Controllers/LoginControllers/login_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
// import 'package:rive/rive.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKeyEmail = GlobalKey<FormState>();

  LoginController logincontroller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: logincontroller,
        builder: (contextb) {
          return Scaffold(
            backgroundColor: Color(0xffd6e2ea),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  logincontroller.backpage();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: HeadingWidget1(
                            headingtext: "Sign in to your account",
                          ),
                        ),
                      ),
                      // if (logincontroller.teddyArtboard != null)
                      //   SizedBox(
                      //     width: 200.sp,
                      //     height: 200.sp,
                      //     child: Rive(
                      //       artboard: logincontroller.teddyArtboard!,
                      //       fit: BoxFit.fitWidth,
                      //     ),
                      //   ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //       top: 10.sp, bottom: 20.sp, right: 4.sp, left: 4.sp),
                      //   decoration: BoxDecoration(
                      //       color: ColorConstraints.white,
                      //       borderRadius: BorderRadius.all(Radius.circular(20))),
                      //   width: 61.sp,
                      //   height: 2.sp,
                      // )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffd6e2ea),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.sp),
                            topRight: Radius.circular(20.sp))),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(children: [
                          Form(
                            key: formKeyEmail,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelWidget(
                                  labeltext: "Email*",
                                ),
                                TextFieldWidgetemail(
                                  validationfunction: (validate_value) =>
                                      logincontroller
                                          .validateEmail(validate_value),
                                  controllertextfield: logincontroller.semail,
                                  hinttextfield: "Enter your email",
                                  onTapfunc: () {},
                                  // logincontroller.lookOnTheTextField,
                                  onChangedfunc: (a) {},
                                  // logincontroller.moveEyeBalls
                                ),
                                LabelWidget(
                                  labeltext: "Password*",
                                ),
                                Obx(
                                  () => TextFieldWidgetobspass(
                                      ontapfunc: () {},
                                      // logincontroller.handsOnTheEyes,
                                      validationfunction: (validate_value) =>
                                          logincontroller
                                              .validateNull(validate_value),
                                      controllertextfield:
                                          logincontroller.spassword,
                                      hinttextfield: "Enter your Password",
                                      isHidden: logincontroller.hidepass.value,
                                      togglePasswordView:
                                          logincontroller.hidenshowpass),
                                ),
                                Obx(
                                  () => CheckboxListTile(
                                    checkColor: ColorConstraints.white,
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Remember me"), //    <-- label
                                    value: logincontroller.checkboxval.value,
                                    activeColor: ColorConstraints.primarycolor,
                                    onChanged: (newValue) {
                                      logincontroller.checkboxvalupdate();
                                    },
                                    controlAffinity: ListTileControlAffinity
                                        .leading, //  <-- leading Checkbox
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      logincontroller.loading == false
                          ? Custombuttonback(
                              ontapaction: () {
                                if (formKeyEmail.currentState!.validate()) {
                                  // logincontroller.underprogess();
                                  logincontroller.loginuser(
                                      logincontroller.semail.text,
                                      logincontroller.spassword.text);
                                }
                              },
                              buttontext: "Sign in")
                          : Custombuttonbackloading(),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            logincontroller.forgotpass();
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ColorConstraints.secondarycolor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

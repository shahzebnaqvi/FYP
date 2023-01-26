import 'dart:io';

import 'package:file_picker/file_picker.dart';
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
  var typeargu = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: registerController,
        builder: (contexta) {
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
                        HeadingWidget1(
                            headingtext:
                                "Register to your account as\n${typeargu['type']}"),
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
                                registerController
                                    .validateEmail(validate_value),
                            controllertextfield: registerController.remail,
                            hinttextfield: "Enter your email"),
                        LabelWidget(
                          labeltext: "Password*",
                        ),
                        Obx(
                          () => TextFieldWidgetobs(
                              validationfunction: (validate_value) =>
                                  registerController
                                      .validateNull(validate_value),
                              controllertextfield: registerController.rpassword,
                              hinttextfield: "Enter your Password",
                              isHidden: registerController.hidepass.value,
                              togglePasswordView:
                                  registerController.hidenshowpass),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        LabelWidget(
                          labeltext: "Profile*",
                        ),
                        GetBuilder(
                            init: registerController,
                            builder: (registerController) {
                              return Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    if (registerController.results != null)
                                      CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                        backgroundImage: FileImage(
                                          File(registerController
                                              .results.files.single.path),
                                        ),
                                      ),
                                    InkWell(
                                      onTap: () async {
                                        registerController.results =
                                            await FilePicker.platform.pickFiles(
                                                type: FileType.custom,
                                                allowMultiple: false,
                                                allowedExtensions: [
                                              'pdf',
                                              'jpg',
                                              'png',
                                              'jpeg'
                                            ]);
                                        // setState(() {
                                        registerController.results =
                                            registerController.results;
                                        registerController.updateimg(
                                            registerController.results);
                                        // });
                                        if (registerController.results ==
                                            null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text("content"),
                                            ),
                                          );
                                        }
                                        var pathname = registerController
                                            .results.files.single.path;
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.add,
                                          color:
                                              ColorConstraints.secondarycolor,
                                        ),
                                      ),
                                    ),
                                  ]);
                            }),
                        if (typeargu['type'] == "Doctor") ...[
                          LabelWidget(
                            labeltext: "Field*",
                          ),
                          Obx(
                            () => AppDropdownInput(
                              hintText: registerController.fielddoctor.value,
                              options: [
                                "Select",
                                "Family physicians",
                                "Internists",
                                "Emergency physicians",
                                "Psychiatrists",
                                "Obstetricians and gynecologists",
                                "Neurologists",
                                "Radiologists",
                                "Anesthesiologists"
                              ],
                              value:
                                  // "General Question",
                                  registerController.fielddoctor.value,
                              onChangedfunc: (String value) =>
                                  registerController.changefielddoctor(value),
                              getLabel: (String value) => value,
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 20.h,
                        ),
                        registerController.loading == true
                            ? Custombuttonbackloading()
                            : Custombuttonbacknopad(
                                ontapaction: () {
                                  if (registerForm.currentState!.validate()) {
                                    if (typeargu['type'] == "Doctor") {
                                      registerController.signupfunction(
                                          registerController.remail.text,
                                          registerController.rpassword.text,
                                          registerController.rfname.text,
                                          registerController.results,
                                          "${typeargu['type']}",
                                          registerController.fielddoctor.value);
                                    }
                                    if (typeargu['type'] == "Patient") {
                                      registerController.signupfunctionPatient(
                                        registerController.remail.text,
                                        registerController.rpassword.text,
                                        registerController.rfname.text,
                                        registerController.results,
                                        "${typeargu['type']}",
                                      );
                                    }
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
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class TextFieldWidget extends StatelessWidget {
  final controllertextfield;
  final hinttextfield;
  final validationfunction;
  const TextFieldWidget(
      {super.key,
      required this.controllertextfield,
      required this.hinttextfield,
      required this.validationfunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => validationfunction(value),
        controller: controllertextfield,
        inputFormatters: [
          LengthLimitingTextInputFormatter(45),
        ],
        decoration: InputDecoration(
          hintText: "$hinttextfield",
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
        ));
  }
}

class TextFieldWidgetobs extends StatelessWidget {
  final controllertextfield;
  final hinttextfield;
  final isHidden;
  final togglePasswordView;
  final validationfunction;
  const TextFieldWidgetobs(
      {super.key,
      required this.controllertextfield,
      required this.hinttextfield,
      required this.isHidden,
      required this.togglePasswordView,
      this.validationfunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => validationfunction(value),
        controller: controllertextfield,
        inputFormatters: [
          LengthLimitingTextInputFormatter(45),
        ],
        obscureText: isHidden,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: InkWell(
            onTap: togglePasswordView,
            child: Icon(
              color: ColorConstraints.bordercolor,
              isHidden ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          hintText: "$hinttextfield",
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
        ));
  }
}

class TextFieldWidgetwhite extends StatelessWidget {
  final controllertextfield;
  final hinttextfield;
  const TextFieldWidgetwhite(
      {super.key,
      required this.controllertextfield,
      required this.hinttextfield});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.sp,
        bottom: 20.sp,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: ColorConstraints.white,
        borderRadius: BorderRadius.circular(5.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
          controller: controllertextfield,
          inputFormatters: [
            LengthLimitingTextInputFormatter(45),
          ],
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: ColorConstraints.secondarycolor,
            ),
            // prefix: Icon(
            //   Icons.straight,
            //   color: ColorConstraints.secondarycolor,
            // ),
            prefix: Text(
              "|  ",
              style: TextStyle(color: ColorConstraints.secondarycolor),
            ),
            hintText: "$hinttextfield", isDense: true,
            hintStyle: TextStyle(fontSize: 14.sp),
            contentPadding:
                EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
            border: InputBorder.none,
          )),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.errorText,
    // required this.validator,
  }) : super(key: key);
  final String? errorText;
  final TextEditingController controller;
  final String labelText;
  // String? Function(String?)? validator;
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 9),
      width: MediaQuery.of(context).size.width * 0.9,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.06,
      ),
      child: TextFormField(
        style: TextStyle(color: Color(0xff6e6b7b)),
        cursorColor: ColorConstraints.primarycolor,
        toolbarOptions: const ToolbarOptions(copy: false),
        // validator: widget.validator,
        inputFormatters: [
          LengthLimitingTextInputFormatter(45),
        ],

        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: TextCapitalization.sentences,
        obscureText: passwordVisible,
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 3, bottom: 3, left: 13),
            errorText: widget.errorText,
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
            focusColor: Colors.black,
            labelStyle: const TextStyle(color: Color(0xffb8c2cc)),
            hintText: widget.labelText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: Color(0xffd8d6de),
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide:
                  BorderSide(color: ColorConstraints.primarycolor, width: 0.5),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(color: Colors.black, width: 0.5)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(color: Colors.red, width: 0.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(color: Colors.red, width: 0.5))),
      ),
    );
  }
}

class TextFieldWidgetDatefield extends StatelessWidget {
  final controllertextfield;
  final hinttextfield;
  final ontapbutn;
  const TextFieldWidgetDatefield(
      {super.key,
      required this.controllertextfield,
      required this.hinttextfield,
      required this.ontapbutn});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: false,
        controller: controllertextfield,
        inputFormatters: [
          LengthLimitingTextInputFormatter(45),
        ],
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: () {
                ontapbutn();
              },
              child: Icon(Icons.calendar_month)),
          hintText: "$hinttextfield",
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
        ));
  }
}

class TextFieldWidgetpost extends StatelessWidget {
  final controllertextfield;
  final hinttextfield;
  final callit;
  const TextFieldWidgetpost(
      {super.key,
      required this.controllertextfield,
      required this.hinttextfield,
      required this.callit});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controllertextfield,
        inputFormatters: [
          LengthLimitingTextInputFormatter(45),
        ],
        decoration: InputDecoration(
          isDense: true,
          suffix: InkWell(
            onTap: () {
              callit();
            },
            child: Text(
              "Post",
              style: TextStyle(
                  color: ColorConstraints.primarycolor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          hintText: "$hinttextfield",
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
        ));
  }
}

class AppDropdownInput extends StatelessWidget {
  final String hintText;
  final List options;
  final value;
  final getLabel;
  final onChangedfunc;

  AppDropdownInput({
    this.hintText = 'Please select an Option',
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChangedfunc,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldStatestate) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: ColorConstraints.bordercolor),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: ColorConstraints.bordercolor),
            ),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              isDense: true,
              onChanged: (a) {
                print(a);
                onChangedfunc(a);
              },
              items: options.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(getLabel(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class TextFieldWidgettextarea extends StatelessWidget {
  final controllertextfield;
  final hinttextfield;
  final validationfunction;

  const TextFieldWidgettextarea(
      {super.key,
      required this.controllertextfield,
      required this.hinttextfield,
      required this.validationfunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: null,
        minLines: 3,
        keyboardType: TextInputType.multiline,
        controller: controllertextfield,
        inputFormatters: [
          LengthLimitingTextInputFormatter(45),
        ],
        decoration: InputDecoration(
          hintText: "$hinttextfield",
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
        ));
  }
}

class TextFieldWidgetfileupload extends StatelessWidget {
  final hinttextfield;
  final ontapbutn;
  const TextFieldWidgetfileupload(
      {super.key, required this.hinttextfield, required this.ontapbutn});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(45),
        ],
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: () {
                ontapbutn();
              },
              child: Transform.rotate(
                  angle: 180 * 10 / 180, child: Icon(Icons.attach_file))),
          hintText: "$hinttextfield",
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: ColorConstraints.bordercolor),
          ),
        ));
  }
}

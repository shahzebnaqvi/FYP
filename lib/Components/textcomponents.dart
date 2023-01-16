import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class Textcomponentunderline extends StatelessWidget {
  final String textunnderline;
  const Textcomponentunderline({super.key, required this.textunnderline});

  @override
  Widget build(BuildContext context) {
    return Text(
      textunnderline,
      style: TextStyle(
          decoration: TextDecoration.underline,
          color: ColorConstraints.primarycolor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400),
    );
  }
}

class Textcomponent extends StatelessWidget {
  final String textcomp;
  const Textcomponent({super.key, required this.textcomp});

  @override
  Widget build(BuildContext context) {
    return Text(
      textcomp,
      style: TextStyle(
          color: ColorConstraints.blackcolor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400),
    );
  }
}

class Textcomponentlg extends StatelessWidget {
  final String textcomp;
  const Textcomponentlg({super.key, required this.textcomp});

  @override
  Widget build(BuildContext context) {
    return Text(
      textcomp,
      style: TextStyle(
          color: ColorConstraints.blackcolor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400),
    );
  }
}

class Textcomponent1 extends StatelessWidget {
  final String textcomp;
  const Textcomponent1({super.key, required this.textcomp});

  @override
  Widget build(BuildContext context) {
    return Text(
      textcomp,
      style: TextStyle(
          color: ColorConstraints.blackcolor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400),
    );
  }
}

class Textcomponent2 extends StatelessWidget {
  final String textcomp;
  const Textcomponent2({super.key, required this.textcomp});

  @override
  Widget build(BuildContext context) {
    return Text(
      textcomp,
      style: TextStyle(
          color: ColorConstraints.paracolor1,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400),
    );
  }
}

class Textcomponent3 extends StatelessWidget {
  final String textcomp;
  const Textcomponent3({super.key, required this.textcomp});

  @override
  Widget build(BuildContext context) {
    return Text(
      textcomp,
      style: TextStyle(
          color: ColorConstraints.secondarycolor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400),
    );
  }
}

class Textcomponent2under extends StatelessWidget {
  final String textcomp;
  const Textcomponent2under({super.key, required this.textcomp});

  @override
  Widget build(BuildContext context) {
    return Text(
      textcomp,
      style: TextStyle(
          decoration: TextDecoration.underline,
          color: ColorConstraints.secondarycolor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class ParaWidget extends StatelessWidget {
  final paratext;
  const ParaWidget({super.key, required this.paratext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$paratext",
      style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstraints.paracolor),
    );
  }
}

class ParaWidgetlg extends StatelessWidget {
  final paratext;
  const ParaWidgetlg({super.key, required this.paratext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$paratext",
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstraints.paracolor),
    );
  }
}

class ParaWidgetsmsm extends StatelessWidget {
  final paratext;
  const ParaWidgetsmsm({super.key, required this.paratext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$paratext",
      style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstraints.paracolor1),
    );
  }
}

class ParaWidgetsm extends StatelessWidget {
  final paratext;
  const ParaWidgetsm({super.key, required this.paratext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$paratext",
      style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstraints.paracolor),
    );
  }
}

class ParaWidgetboldcolo extends StatelessWidget {
  final paratext;
  const ParaWidgetboldcolo({super.key, required this.paratext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$paratext",
      style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: ColorConstraints.secondarycolor),
    );
  }
}

class ParaWidgetunderlinebold extends StatelessWidget {
  final paratext;
  const ParaWidgetunderlinebold({super.key, required this.paratext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$paratext",
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

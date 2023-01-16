import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class HeadingWidgetex extends StatelessWidget {
  final headingtext;
  const HeadingWidgetex({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "$headingtext",
      style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
    );
  }
}

class HeadingWidget1 extends StatelessWidget {
  final headingtext;
  const HeadingWidget1({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      "$headingtext",
      style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w700),
    );
  }
}

class HeadingWidget1white extends StatelessWidget {
  final headingtext;
  const HeadingWidget1white({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      "$headingtext",
      style: TextStyle(
          fontSize: 23.sp,
          fontWeight: FontWeight.w700,
          color: ColorConstraints.white),
    );
  }
}

class HeadingWidget12 extends StatelessWidget {
  final headingtext;
  const HeadingWidget12({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$headingtext",
      style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w700),
    );
  }
}

class HeadingWidget1black extends StatelessWidget {
  final headingtext;
  const HeadingWidget1black({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      "$headingtext",
      style: TextStyle(
          fontSize: 23.sp,
          fontWeight: FontWeight.w700,
          color: ColorConstraints.blackcolor),
    );
  }
}

class HeadingWidget1blacklight extends StatelessWidget {
  final headingtext;
  const HeadingWidget1blacklight({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      "$headingtext",
      style: TextStyle(
          fontSize: 23.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstraints.blackcolor),
    );
  }
}

class HeadingWidget2 extends StatelessWidget {
  final headingtext;
  const HeadingWidget2({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      "$headingtext",
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
    );
  }
}

class HeadingWidget3 extends StatelessWidget {
  final headingtext;
  const HeadingWidget3({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$headingtext",
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: ColorConstraints.blackcolor),
    );
  }
}

class HeadingWidget4 extends StatelessWidget {
  final headingtext;
  const HeadingWidget4({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$headingtext",
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstraints.blackcolor),
    );
  }
}

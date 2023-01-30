import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/Patient/appointment_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class DoctorFeatures extends StatelessWidget {
  final featuretext;
  final featureicon;
  final featurecolor;
  const DoctorFeatures(
      {super.key,
      required this.featuretext,
      required this.featureicon,
      required this.featurecolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        boxShadow: [
          // to make elevation
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
        ],
        color: featurecolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.sp),
          topRight: Radius.circular(20.sp),
          bottomLeft: Radius.circular(20.sp),
          bottomRight: Radius.circular(20.sp),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            featureicon,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
              color: ColorConstraints.white,
            ),
          ),
          Text(
            featuretext,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: ColorConstraints.white,
            ),
          ),
        ],
      ),
    );
  }
}

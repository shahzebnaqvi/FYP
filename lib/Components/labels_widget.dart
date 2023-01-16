import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelWidget extends StatelessWidget {
  final labeltext;
  const LabelWidget({super.key, required this.labeltext});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20.sp, bottom: 5.sp),
        child: Text(
          "$labeltext",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ));
  }
}

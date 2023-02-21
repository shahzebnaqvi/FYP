import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Components/buttons_widget.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class HeadingRow extends StatelessWidget {
  final ontapaction;

  final headingtext;
  final btntext;
  const HeadingRow(
      {super.key,
      required this.headingtext,
      required this.btntext,
      required this.ontapaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.sp, bottom: 4.sp),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${headingtext}",
            style: TextStyle(
                color: ColorConstraints.blackcolor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
          ),
          Custombuttontranssm(
            ontapaction: () {
              ontapaction();
            },
            buttontext: "${btntext}",
          ),
        ],
      ),
    );
  }
}

class HeadingRowhead extends StatelessWidget {
  final headingtext;

  const HeadingRowhead({super.key, required this.headingtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.sp, bottom: 10.sp),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${headingtext}",
            style: TextStyle(
                color: ColorConstraints.primary2,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

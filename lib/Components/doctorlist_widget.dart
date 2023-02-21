import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';

class DoctorWidget extends StatelessWidget {
  final imagelink;
  final doctname;
  final doctcat;
  final OnTapbutton;
  const DoctorWidget(
      {super.key,
      required this.imagelink,
      required this.doctname,
      required this.doctcat,
      required this.OnTapbutton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OnTapbutton();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 15.sp,
          // bottom: MediaQuery.of(context).size.height * 0.020,
          left: 10.sp,
          right: 10.sp,
        ),
        padding: EdgeInsets.only(
          top: 10.sp,
          bottom: 10.sp,
          right: 10.sp,
          left: 10.sp,
        ),
        width: MediaQuery.of(context).size.width * .92,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0, color: Colors.white),
          borderRadius: BorderRadius.circular(5.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
                height: 110.sp,
                width: 110.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.sp)),
                  image: DecorationImage(
                      image: NetworkImage(imagelink),
                      fit: BoxFit.cover,
                      alignment: Alignment.centerRight),
                )),
            SizedBox(
              width: 10.sp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dr $doctname",
                    style: TextStyle(
                        color: ColorConstraints.primary2,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 12.0),
                  child: Text(doctcat,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorConstraints.greylight)),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Online",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorConstraints.greenlight),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

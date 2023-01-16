import 'package:flutter/material.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RichtextWidget extends StatelessWidget {
  final text1;
  final text2;
  final text1color;
  final text2color;
  final text1font;
  final text2font;

  RichtextWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.text1color,
    required this.text2color,
    required this.text1font,
    required this.text2font,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '$text1',
              style: TextStyle(
                  fontFamily: "Roboto",
                  color: text1color,
                  fontSize: text1font,
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: '',
              style: TextStyle(
                  fontFamily: "Roboto",
                  color: text1color,
                  fontSize: text1font,
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: '$text2',
              style: TextStyle(
                  fontFamily: "Roboto",
                  color: text2color,
                  fontSize: text2font,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class RichtextWidgetPrice extends StatelessWidget {
  final text1;
  final text2;

  RichtextWidgetPrice({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: ColorConstraints.blackcolor,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '$text1',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: '$text2',
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class RichtextWidgetPrice1 extends StatelessWidget {
  final text1;
  final text2;

  RichtextWidgetPrice1({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: ColorConstraints.blackcolor,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '$text1',
              style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: '$text2',
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class RichtextWidgetPrice2 extends StatelessWidget {
  final text1;
  final text2;

  RichtextWidgetPrice2({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: ColorConstraints.blackcolor,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '$text1',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: ' ',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: '$text2',
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class RichtextWidgetPrice3 extends StatelessWidget {
  final text1;
  final text2;

  RichtextWidgetPrice3({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: ColorConstraints.blackcolor,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '$text1',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: ' ',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: '$text2',
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

class RichtextWidgetPrice4 extends StatelessWidget {
  final text1;
  final text2;

  RichtextWidgetPrice4({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: ColorConstraints.blackcolor,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '$text1',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorConstraints.blackcolor,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: ' ',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: '$text2',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorConstraints.primarycolor,
                  fontFamily: "Roboto",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

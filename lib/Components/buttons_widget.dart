import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class Custombuttonback extends StatelessWidget {
  final ontapaction;
  final buttontext;
  const Custombuttonback(
      {super.key, required this.ontapaction, this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: 20.sp, right: 20.sp, top: 5.sp, bottom: 10.sp),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          ontapaction();
        },
      ),
    );
  }
}

class Custombuttonbackloading extends StatelessWidget {
  const Custombuttonbackloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: 20.sp, right: 20.sp, top: 5.sp, bottom: 10.sp),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(8.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}

class Custombuttontrans extends StatelessWidget {
  final ontapaction;
  final buttontext;
  const Custombuttontrans(
      {super.key, required this.ontapaction, this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: 20.sp, right: 20.sp, top: 5.sp, bottom: 10.sp),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.all(12.sp),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorConstraints.primarycolor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        child: Text(
          buttontext,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorConstraints.primarycolor,
          ),
        ),
        onPressed: () {
          ontapaction();
        },
      ),
    );
  }
}

class Custombuttonbacknopad extends StatelessWidget {
  final ontapaction;
  final buttontext;
  const Custombuttonbacknopad(
      {super.key, required this.ontapaction, this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          ontapaction();
        },
      ),
    );
  }
}

class Custombuttontransnopad extends StatelessWidget {
  final ontapaction;
  final buttontext;
  const Custombuttontransnopad(
      {super.key, required this.ontapaction, this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.all(12.sp),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorConstraints.primarycolor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        child: Text(
          buttontext,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorConstraints.primarycolor,
          ),
        ),
        onPressed: () {
          ontapaction();
        },
      ),
    );
  }
}

class Custombuttontranssm extends StatelessWidget {
  final ontapaction;
  final buttontext;
  const Custombuttontranssm(
      {super.key, required this.ontapaction, this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding:
              EdgeInsets.only(top: 5.sp, bottom: 5.sp, right: 7.sp, left: 7.sp),
          minimumSize: Size.zero, // Set this
          // padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorConstraints.primarycolor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.sp),
          ),
        ),
        child: Text(
          buttontext,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: ColorConstraints.primarycolor,
          ),
        ),
        onPressed: () {
          ontapaction();
        },
      ),
    );
  }
}

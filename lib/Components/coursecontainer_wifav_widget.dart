import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:medicalapp/Utils/font_constraints.dart';

class CourseContainerWifavWidget extends StatelessWidget {
  final coursetag;
  final courseperson;
  final courseheading;
  final coursetype;
  final rating;
  final duration;
  final online;
  final paidunpaid;
  final personrating;
  final tag2;
  final onfavouite;
  final courselink;
  final courseimg;
  final colorback;
  final tagbackcolor;
  const CourseContainerWifavWidget(
      {super.key,
      required this.coursetag,
      required this.courseperson,
      required this.courseheading,
      required this.coursetype,
      required this.rating,
      required this.duration,
      required this.online,
      required this.paidunpaid,
      required this.personrating,
      required this.tag2,
      required this.onfavouite,
      required this.courselink,
      required this.courseimg,
      required this.colorback,
      required this.tagbackcolor});

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      child: Container(
        padding: EdgeInsets.all(8.sp),
        margin: EdgeInsets.all(10.sp),
        // margin: EdgeInsets.only(left: 15.sp, top: 5.sp, bottom: 10.sp),
        decoration: BoxDecoration(
          color: ColorConstraints.white,
          borderRadius: BorderRadius.circular(8.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 140.h,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                courselink();
              },
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 151.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.sp),
                        color: colorback,
                        image: DecorationImage(
                            image: AssetImage(FileConstraints.logo1),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 106.h,
                            width: 155.w,
                          ),
                          Positioned(
                            top: 5.sp,
                            left: 5.sp,
                            right: 5.sp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 2.sp,
                                    left: 4.sp,
                                    bottom: 2.sp,
                                    right: 4.sp,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.sp),
                                    color: tagbackcolor,
                                  ),
                                  child: Text(
                                    "($tag2)",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: FontConstraint.para1,
                                        color: ColorConstraints.primarycolor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -20,
                            right: -20,
                            child: CircleAvatar(
                              radius: 27.sp,
                              backgroundColor:
                                  ColorConstraints.white.withOpacity(0.8),
                            ),
                          ),
                          Positioned(
                              bottom: 6.sp,
                              right: 6.sp,
                              child: Image.asset(
                                courseimg,
                                height: 18.sp,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      width: 220.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: 4.sp,
                                  left: 4.sp,
                                  bottom: 4.sp,
                                  right: 6.sp,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.sp),
                                  color: ColorConstraints.backgroundsecondary,
                                ),
                                child: Text(
                                  "$coursetag",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: FontConstraint.para1,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 2.sp),
                                  Text(
                                    "($personrating)",
                                    style: TextStyle(
                                        fontSize: FontConstraint.para0,
                                        color: ColorConstraints.greyshade),
                                  ),
                                  SizedBox(width: 25.w),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              courselink();
                            },
                            child: Text(
                              "$courseheading",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorConstraints.blackcolor,
                                  fontSize: FontConstraint.para3,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "($coursetype)",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ColorConstraints.secondarycolor,
                                fontSize: FontConstraint.para1,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    size: 11.sp,
                                    color: ColorConstraints.blackcolor,
                                  ),
                                  SizedBox(
                                    width: 3.sp,
                                  ),
                                  Text(
                                    "$duration",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: FontConstraint.para0),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.monitor,
                                    size: 11.sp,
                                    color: ColorConstraints.blackcolor,
                                  ),
                                  SizedBox(
                                    width: 3.sp,
                                  ),
                                  Text(
                                    "$online",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: FontConstraint.para0),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$paidunpaid",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: ColorConstraints.blackcolor,
                                    fontSize: FontConstraint.para2,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "$courseperson",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: FontConstraint.para1,
                                    color: ColorConstraints.greyshade),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10.sp,
              right: 10.sp,
              child: GestureDetector(
                onTap: () {
                  onfavouite();
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: 3.sp,
                    left: 3.sp,
                    bottom: 3.sp,
                    right: 3.sp,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.sp),
                    color: ColorConstraints.tagshade1,
                  ),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 14.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CourseContaineractive extends StatelessWidget {
  final coursetag;
  final courseheading;
  final duration;
  final online;
  final tag2;
  final onfavouite;
  final courselink;
  final courseimg;
  final colorback;
  final tagbackcolor;
  final progresssuccess;
  const CourseContaineractive(
      {super.key,
      required this.coursetag,
      required this.courseheading,
      required this.duration,
      required this.online,
      required this.tag2,
      required this.onfavouite,
      required this.courselink,
      required this.courseimg,
      required this.colorback,
      required this.tagbackcolor,
      required this.progresssuccess});

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      child: GestureDetector(
        onTap: () {
          courselink();
        },
        child: Container(
          padding: EdgeInsets.all(8.sp),
          margin: EdgeInsets.all(10.sp),
          // margin: EdgeInsets.only(left: 15.sp, top: 5.sp, bottom: 10.sp),
          decoration: BoxDecoration(
            color: ColorConstraints.white,
            borderRadius: BorderRadius.circular(8.sp),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: 140.h,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 151.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.sp),
                  color: colorback,
                  image: DecorationImage(
                      image: AssetImage(FileConstraints.logo1),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 106.h,
                      width: 155.w,
                    ),
                    Positioned(
                      top: 5.sp,
                      left: 5.sp,
                      right: 5.sp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 2.sp,
                              left: 4.sp,
                              bottom: 2.sp,
                              right: 4.sp,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.sp),
                              color: tagbackcolor,
                            ),
                            child: Text(
                              "($tag2)",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontConstraint.para1,
                                  color: ColorConstraints.primarycolor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: -20,
                      child: CircleAvatar(
                        radius: 27.sp,
                        backgroundColor:
                            ColorConstraints.white.withOpacity(0.8),
                      ),
                    ),
                    Positioned(
                        bottom: 6.sp,
                        right: 6.sp,
                        child: Image.asset(
                          courseimg,
                          height: 18.sp,
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Container(
                width: 220.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 4.sp,
                            left: 4.sp,
                            bottom: 4.sp,
                            right: 6.sp,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: ColorConstraints.backgroundsecondary,
                          ),
                          child: Text(
                            "$coursetag",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: FontConstraint.para1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "$courseheading",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorConstraints.blackcolor,
                          fontSize: FontConstraint.para3,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.alarm,
                              size: 11.sp,
                              color: ColorConstraints.blackcolor,
                            ),
                            SizedBox(
                              width: 3.sp,
                            ),
                            Text(
                              "$duration",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: FontConstraint.para0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.monitor,
                              size: 11.sp,
                              color: ColorConstraints.blackcolor,
                            ),
                            SizedBox(
                              width: 3.sp,
                            ),
                            Text(
                              "$online",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: FontConstraint.para0),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${progresssuccess * 100}%",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w400),
                        ),
                        if (progresssuccess == 1) ...[
                          Image.asset(FileConstraints.logo1)
                        ]
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: progresssuccess,
                        color: ColorConstraints.secondarycolor,
                        backgroundColor: ColorConstraints.progresscolrback,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

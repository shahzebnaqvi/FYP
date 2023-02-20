import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

ThemeData myTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: ColorConstraints.primarycolor,
    secondary: ColorConstraints.secondarycolor,
  ),
  scaffoldBackgroundColor: Colors.white,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  listTileTheme: ListTileThemeData(
    horizontalTitleGap: 0,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: ColorConstraints.blackcolor,
      fontFamily: "Helvetica",
    ),
    titleLarge: TextStyle(
      color: ColorConstraints.blackcolor,
      fontFamily: "Helvetica",
    ),
    bodyMedium: TextStyle(
      color: ColorConstraints.blackcolor,
      fontFamily: "Helvetica",
    ),
  ),
  fontFamily: "Helvetica",
);

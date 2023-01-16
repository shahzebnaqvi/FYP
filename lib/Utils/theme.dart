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
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

  // textTheme: const TextTheme(
  //   headline1: TextStyle(
  //     fontWeight: FontWeight.w800,
  //     fontSize: 36,
  //   ),
  //   headline2: TextStyle(
  //     fontWeight: FontWeight.w700,
  //     fontSize: 26,
  //   ),
  //   headline3: TextStyle(
  //     fontWeight: FontWeight.w600,
  //     fontSize: 16,
  //   ),
  //   headline4: TextStyle(
  //     fontWeight: FontWeight.w600,
  //     fontSize: 12,
  //   ),
  //   headline5: TextStyle(
  //     fontWeight: FontWeight.w400,
  //     fontSize: 14,
  //   ),
  // ),

  fontFamily: "Roboto",
);

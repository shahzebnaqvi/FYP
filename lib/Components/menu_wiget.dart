import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class Menubutton extends StatelessWidget {
  final menutext;
  final menuicon;
  const Menubutton({
    super.key,
    required this.menutext,
    required this.menuicon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
      dense: true,
      // minLeadingWidth: 2,
      // leading: Icon(menuicon),
      leading: SvgPicture.asset(menuicon),
      title: Text(
        "$menutext",
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
      ),
    );
  }
}

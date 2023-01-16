import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class ListTileCompPage extends StatelessWidget {
  final listtiletitle;
  const ListTileCompPage({super.key, required this.listtiletitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$listtiletitle",
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ColorConstraints.blackcolor,
      ),
    );
  }
}

class ListTilebtnmore extends StatelessWidget {
  final listtiletitle;
  final listtiletitleimage;
  final calllisttile;
  const ListTilebtnmore(
      {super.key,
      required this.listtiletitle,
      required this.listtiletitleimage,
      required this.calllisttile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        calllisttile();
      },
      child: ListTile(
        leading: SvgPicture.asset(listtiletitleimage),
        title: Text(
          "$listtiletitle",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

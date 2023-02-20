import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';

import '../../Controllers/bottom_bar_controller.dart';

class Bottomnavbar extends StatelessWidget {
  Bottomnavbar({super.key});

  @override
  BottombarController bottomcontroller = Get.put(BottombarController());

  Widget build(BuildContext context) {
    return Obx(
      (() => Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.sp),
                    topRight: Radius.circular(25.sp))),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              // currentIndex: bottomcontroller.selectedIndex.value,
              currentIndex: 0,
              selectedItemColor: ColorConstraints.primarycolor,
              unselectedItemColor: ColorConstraints.primarycolor,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              iconSize: 20,
              selectedFontSize: 0,
              onTap: bottomcontroller.onItemTapped,
              elevation: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: bottomcontroller.selectedIndex.value == 0
                      ? Buttonbackcolor(
                          filename: "assets/images/icons/home.png",
                          colorname: ColorConstraints.menubuttonback)
                      : Buttonbackcolor(
                          filename: "assets/images/icons/home2.png",
                          colorname: ColorConstraints.white.withOpacity(0.2)),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: bottomcontroller.selectedIndex.value == 1
                      ? Padding(
                          padding: EdgeInsets.only(right: 25.sp),
                          child: Buttonbackcolor(
                              filename: "assets/images/icons/schedule2.png",
                              colorname: ColorConstraints.menubuttonback),
                        )
                      : Padding(
                          padding: EdgeInsets.only(right: 25.sp),
                          child: Buttonbackcolor(
                              filename: "assets/images/icons/schedule.png",
                              colorname:
                                  ColorConstraints.white.withOpacity(0.2)),
                        ),
                  label: 'Doctors',
                ),
                BottomNavigationBarItem(
                  icon: bottomcontroller.selectedIndex.value == 2
                      ? Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Buttonbackcolor(
                              filename: "assets/images/icons/menu2.png",
                              colorname: ColorConstraints.menubuttonback),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Buttonbackcolor(
                              filename: "assets/images/icons/menu.png",
                              colorname:
                                  ColorConstraints.white.withOpacity(0.2)),
                        ),
                  label: 'Appointments',
                ),
                BottomNavigationBarItem(
                  icon: bottomcontroller.selectedIndex.value == 3
                      ? Buttonbackcolor(
                          filename: "assets/images/icons/person.png",
                          colorname: ColorConstraints.menubuttonback)
                      : Buttonbackcolor(
                          filename: "assets/images/icons/person2.png",
                          colorname: ColorConstraints.white.withOpacity(0.2)),
                  // icon: Icon(FontAwesomeIcons.user),
                  label: 'Profile',
                ),
                // BottomNavigationBarItem(
              ],
            ),
          )),
    );
  }
}

class Buttonbackcolor extends StatelessWidget {
  final filename;
  final colorname;
  const Buttonbackcolor(
      {super.key, required this.filename, required this.colorname});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.sp),
      decoration: BoxDecoration(
          color: colorname,
          // border: Border.all(
          //   color: Colors.red,
          // ),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Image.asset(
        filename,
        width: 25.sp,
      ),
    );
  }
}

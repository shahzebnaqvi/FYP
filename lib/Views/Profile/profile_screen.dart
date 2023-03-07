import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Components/listtile_component_page.dart';
import 'package:medicalapp/Components/textcomponents.dart';
import 'package:medicalapp/Controllers/ProfileControllers/profile_controller.dart';
import 'package:medicalapp/Controllers/bottom_bar_controller.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:medicalapp/Views/Auth/auth_home_screen.dart';
import 'package:medicalapp/Views/Patient/Home%20Dashboard/home_dashboard_screen.dart';
import 'package:medicalapp/Views/Patient/Connect%20Device/connect_device_bluetooth.dart';
import 'package:medicalapp/Views/Patient/Report%20Patients/viewall_report_patients.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  ProfileController profileControll = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: HeadingWidget1black(
            headingtext: "Profile",
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Get.offAll(HomeDashboardScreen());
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage("${BaseStorage.storage.read("profile")}"),
                    radius: 50,
                  ),
                  title: Text(
                    "${BaseStorage.storage.read("username")}",
                    style: TextStyle(
                        color: ColorConstraints.blackcolor,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "${BaseStorage.storage.read("email")}",
                    style: TextStyle(
                        color: ColorConstraints.blackcolor,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // GestureDetector(
                //     onTap: () {
                //       Get.to(ConnectDevice());
                //     },
                //     child: optionprofile(
                //         FileConstraints.profileedit, "Edit Profile")),
                GestureDetector(
                    onTap: () {
                      Get.to(ConnectDevice());
                    },
                    child: optionprofile(
                        FileConstraints.connectdevice, "Connect devices")),
                GetBuilder<BottombarController>(
                    id: '21', // here
                    init: BottombarController(),
                    builder: (value) => GestureDetector(
                        onTap: () {
                          value.onItemTapped(1);
                        },
                        child: optionprofile(
                            FileConstraints.myappointment, "My appointments"))),
                GestureDetector(
                    onTap: () {
                      Get.to(ViewAllReportsPatientScreen());
                    },
                    child:
                        optionprofile(FileConstraints.myreport, "My reports")),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ));
  }
}

Widget optionprofile(img, heading) {
  return ListTile(
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: ColorConstraints.blackcolor,
    ),
    leading: Image(
      image: AssetImage(
        img,
      ),
      width: 40.sp,
    ),
    title: Padding(
      padding: EdgeInsets.all(15.sp),
      child: Text(
        heading,
        style: TextStyle(color: ColorConstraints.blackcolor),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:medicalapp/Components/heading_widget.dart';
import 'package:medicalapp/Components/listtile_component_page.dart';
import 'package:medicalapp/Components/textcomponents.dart';
import 'package:medicalapp/Controllers/ProfileControllers/profile_controller.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Views/Auth/auth_home_screen.dart';
import 'package:medicalapp/Views/Patient/Home%20Dashboard/home_dashboard_screen.dart';
import 'package:medicalapp/Views/Patient/Connect%20Device/connect_device_bluetooth.dart';

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
          headingtext: "Account",
        ),
        actions: [
          GestureDetector(
            onTap: () {
              profileControll.underprogess();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12.sp),
              child: Icon(
                Icons.search,
                color: ColorConstraints.blackcolor,
              ),
            ),
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.offAll(HomeDashboardScreen());
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(right: 30, left: 30, top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 65,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.png"),
                              radius: 50,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: CircleAvatar(
                                backgroundColor: ColorConstraints.primarycolor,
                                radius: 15,
                                child: Icon(
                                  Icons.edit,
                                  size: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Shunaid Shafiq",
                            style:
                                TextStyle(color: ColorConstraints.primarycolor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(
                            color: ColorConstraints.primarycolor,
                            width: 2.0,
                          ),
                          backgroundColor: Colors.transparent),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const EditProfile()),
                        // );
                      },
                      child: Text("Edit"),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Gender",
                            style:
                                TextStyle(color: ColorConstraints.primarycolor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "Male",
                              style: TextStyle(
                                  color: ColorConstraints.primarycolor,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 25, left: 25),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                                width: 1.0,
                                color: ColorConstraints.primarycolor),
                            left: BorderSide(
                                width: 1.0,
                                color: ColorConstraints.primarycolor),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Age",
                              style: TextStyle(
                                  color: ColorConstraints.primarycolor),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "24",
                                style: TextStyle(
                                    color: ColorConstraints.primarycolor,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Location",
                            style:
                                TextStyle(color: ColorConstraints.primarycolor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "NY, USA",
                              style: TextStyle(
                                  color: ColorConstraints.primarycolor,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(ConnectDevice());
                },
                child: Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    // color: primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    border: Border.all(
                        width: 2,
                        color: ColorConstraints
                            .primarycolor //                   <--- border width here
                        ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/images/Devices.png",
                        ),
                        // width: 80,
                      ),
                      Text(
                        "Connect a Device",
                        style: TextStyle(color: ColorConstraints.primarycolor),
                      ),
                      Icon(
                        Icons.bluetooth,
                        color: ColorConstraints.primarycolor,
                      ),
                    ],
                  ),
                ),
              ),
              optionprofile("assets/images/line-graph.png", "Latest Graphs"),
              SizedBox(
                height: 8,
              ),
              optionprofile("assets/images/reports.png", "My Reports"),
              SizedBox(
                height: 8,
              ),
              optionprofile("assets/images/Camera-Video.png", "My Videos"),
              SizedBox(
                height: 8,
              ),
              optionprofile("assets/images/Image-Upload.png", "My Photos"),
              SizedBox(
                height: 8,
              ),
              optionprofile("assets/images/mic.png", "My Audios"),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget optionprofile(img, heading) {
  return ListTile(
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: ColorConstraints.primarycolor,
    ),
    leading: Image(
      image: AssetImage(
        img,
      ),
      // width: 80,
    ),
    title: Text(
      heading,
      style: TextStyle(color: ColorConstraints.primarycolor),
    ),
    tileColor: ColorConstraints.primarycolor.withOpacity(0.3),
  );
}

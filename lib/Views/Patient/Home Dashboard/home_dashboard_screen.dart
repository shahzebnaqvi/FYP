import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Components/menu_wiget.dart';
import 'package:medicalapp/Controllers/bottom_bar_controller.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Services/constant_storage.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:medicalapp/Views/Patient/Home%20Dashboard/bottombar.dart';

final ZoomDrawerController za = ZoomDrawerController();

class HomeDashboardScreen extends StatelessWidget {
  HomeDashboardScreen({Key? key}) : super(key: key);
  BottombarController bottomcontroller = Get.put(BottombarController());

  var tiles = [
    {
      'text': "Neo Analysis",
      'icon': FileConstraints.logo1,
      'screen': Icons.analytics
    },
    {
      'text': "Video Vital",
      'icon': FileConstraints.logo1,
      'screen': Icons.video_call
    },
    {
      'text': "BMI Calculator",
      'icon': FileConstraints.logo1,
      'screen': Icons.calculate
    },
    {
      'text': "BP Record",
      'icon': FileConstraints.logo1,
      'screen': Icons.bug_report
    },
    {
      'text': "Doctor",
      'icon': FileConstraints.logo1,
      'screen': Icons.domain_verification_rounded
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: za,
      reverseDuration: Duration(milliseconds: 100),
      borderRadius: 24,
      style: DrawerStyle.defaultStyle,
      // showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      // duration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 100),
      // showShadow: true,
      angle: -6.0,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      // angle: 0.0,
      drawerShadowsBackgroundColor: Colors.grey,
      moveMenuScreen: false,
      menuScreenWidth: MediaQuery.of(context).size.width,
      menuBackgroundColor: ColorConstraints.primarycolor,
      mainScreen: HomeScreenBody(),
      menuScreen: Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: ColorConstraints.primarycolor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage("${BaseStorage.storage.read("profile")}"),
                  ),
                  title: Text(
                    "${BaseStorage.storage.read("username")}",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "Welcome to Sehatgah",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        za.close!();
                      },
                      icon: Icon(Icons.close)),
                ),
                // SizedBox(
                //   height: 20.sp,
                // ),
                ListView.builder(
                    padding: EdgeInsets.only(top: 10.sp),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(index);
                              Get.toNamed('${tiles[index]['screen']}');
                              print(tiles[index]['screen']);
                            },
                            child: Menubutton(
                                menutext: tiles[index]['text'],
                                menuicon: tiles[index]['icon']),
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 20.sp,
                ),
                GestureDetector(
                    onTap: () {
                      za.close!();
                      BaseStorage.storage.erase();

                      Get.offAllNamed(
                        AppRoutes.doctororpatient,
                      );
                    },
                    child: Menubutton(menutext: "Logout", menuicon: "")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({Key? key}) : super(key: key);
  // var _bottomNavIndex = 0;
  BottombarController bottomcontroller = Get.put(BottombarController());

  // late AnimationController controller = AnimationController(
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Scaffold(
            backgroundColor: ColorConstraints.backgroundcolor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Image.asset(
                FileConstraints.logo2s,
                width: 80,
              ),
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: ColorConstraints.primarycolor,
                ),
                onPressed: () {
                  // print(za.toggle);
                  za.toggle!();
                  // za.open!();
                },
              ),
            ),
            // body: HomeScreen(),

            body: bottomcontroller.screenList
                .elementAt(bottomcontroller.selectedIndex.value),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorConstraints.primarycolor,
              //Floating action button on Scaffold

              onPressed: () {
                bottomcontroller.onItemTapped(4);
                // print(bottomcontroller.selectedIndex.value);
              },
              child: Container(
                child: Image.asset(
                  "assets/images/icons/doctor.png",
                  width: 25.sp,
                ), //icon inside button

                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstraints.primarycolor,
                      spreadRadius: 7,
                      blurRadius: 7,
                      offset: Offset(3, 5),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Bottomnavbar(),
          )),
    );
  }
}

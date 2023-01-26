import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Routes/routes.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';

int _curr = 0;
var _list2 = [1, 2, 3];

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

PageController controller = PageController();
List<Widget> _list = <Widget>[
  PagesOnboard(
      backbool: false,
      titletext: "Welcome To\nSehatgah",
      imagename: "${FileConstraints.oboard1}",
      paratext:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"),
  new PagesOnboard(
      backbool: true,
      titletext: "OnTap Doctor ",
      imagename: "${FileConstraints.oboard2}",
      paratext: "Lorem ipsum dolor sit amet"),
  new PagesOnboard(
      backbool: true,
      titletext: "Ready to Medicate?",
      imagename: "${FileConstraints.oboard3}",
      paratext: 'Get the Advice on your finger tips'),
];

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _list,
        scrollDirection: Axis.horizontal,

        // reverse: true,
        // physics: BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                _list.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: InkWell(
                        onTap: () {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: _curr == index
                            ? Icon(
                                Icons.circle,
                                size: 10.sp,
                                color: ColorConstraints.secondarycolor,
                              )
                            : Icon(
                                Icons.circle_outlined,
                                size: 10.sp,
                                color: ColorConstraints.secondarycolor,
                              ),
                      ),
                    )),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10.sp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
              child: Text(
                _curr != _list.length - 1 ? "Next" : "Get Started",
                style: TextStyle(fontSize: 16.sp),
              ),
              onPressed: () {
                setState(() {});
                if (_curr != _list.length - 1)
                  controller.jumpToPage(_curr + 1);
                else
                  goToHome(context);
                ;
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }
}

Widget buildImage(String path, context) => SvgPicture.asset(
      path,
      fit: BoxFit.fitWidth,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );

class PagesOnboard extends StatefulWidget {
  final titletext;
  final imagename;
  final paratext;
  final backbool;
  const PagesOnboard(
      {super.key,
      this.titletext,
      this.imagename,
      this.paratext,
      this.backbool});

  @override
  State<PagesOnboard> createState() => _PagesOnboardState();
}

class _PagesOnboardState extends State<PagesOnboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Image.asset(
              "${widget.imagename}",
              height: 400.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 30.w, top: 60.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.backbool == false
                      ? Text("")
                      : GestureDetector(
                          onTap: () {
                            print(_curr);

                            if (_curr != _list.length + 1)
                              controller.jumpToPage(_curr - 1);
                            else
                              controller.jumpToPage(0);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: ColorConstraints.white,
                          ),
                        ),
                  GestureDetector(
                    onTap: () {
                      goToHome(context);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: ColorConstraints.secondarycolor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
        // buildImage(FileConstraints.onboarding_image1, context),
        ,
        SizedBox(
          height: 40.h,
        ),
        Text(
          "${widget.titletext}",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30.sp,
              height: 1.3,
              fontWeight: FontWeight.w700,
              color: ColorConstraints.secondarycolor),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
          child: Text(
            "${widget.paratext}",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: ColorConstraints.blackcolor),
          ),
        ),
      ]),
    );
  }
}

void goToHome(BuildContext context) => Get.offAllNamed(
      AppRoutes.doctororpatient,
    );

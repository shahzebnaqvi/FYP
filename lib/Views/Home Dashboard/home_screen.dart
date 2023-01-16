import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:medicalapp/Components/coursecontainer_wifav_widget.dart';
import 'package:medicalapp/Components/heading_row_wiget.dart';
import 'package:medicalapp/Components/sliderwidget.dart';
import 'package:medicalapp/Components/textfield_widget.dart';
import 'package:medicalapp/Controllers/HomeDashControllers/home_controller.dart';
import 'package:medicalapp/Controllers/bottom_bar_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homecontrol = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.sp,
            child: SliderWidget(),
          ),
        ],
      ),
    ));
  }
}

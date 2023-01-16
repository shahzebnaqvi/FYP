import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Utils/font_constraints.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

int _curr = 0;

PageController controller = PageController();
List<Widget> _list = <Widget>[
  SliderWidgettab(
    backbool: false,
    imagename: "${FileConstraints.banner1}",
  ),
  SliderWidgettab(
    backbool: true,
    imagename: "${FileConstraints.banner1}",
  ),
  SliderWidgettab(
    backbool: true,
    imagename: "${FileConstraints.banner1}",
  ),
];

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160.sp,
      // color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170.sp,
            child: PageView(
              children: _list,
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (num) {
                setState(() {
                  _curr = num;
                });
              },
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                _list.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
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
                                Icons.circle,
                                size: 10.sp,
                                color: ColorConstraints.bordercolor,
                              ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}

class SliderWidgettab extends StatefulWidget {
  final imagename;

  final backbool;
  const SliderWidgettab({super.key, this.imagename, this.backbool});

  @override
  State<SliderWidgettab> createState() => _SliderWidgettabState();
}

class _SliderWidgettabState extends State<SliderWidgettab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          color: ColorConstraints.primarycolor,
          borderRadius: BorderRadius.all(
            Radius.circular(20.sp),
          )),
      height: 170.sp,
      child: Stack(
        children: [
          Container(
            height: 170.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.sp),
              color: ColorConstraints.primarycolor,
              image: DecorationImage(
                  image: AssetImage(widget.imagename), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

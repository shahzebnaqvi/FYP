import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/Controllers/bmi_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class Bmi_Result extends StatefulWidget {
  const Bmi_Result({Key? key}) : super(key: key);

  @override
  State<Bmi_Result> createState() => _Bmi_ResultState();
}

class _Bmi_ResultState extends State<Bmi_Result> {
  final bmiController = Get.put(BmiController());
  void initState() {
    super.initState();
    bmiController.bmiresult();
  }
// var a =  bmiController.height.value;s

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: ColorConstraints.primarycolor,
      ),
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.width * 0.5,
              child: Lottie.asset(bmiController.bmilottiefile1)),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.08),
            child: Text(
              "Your Result",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  color: ColorConstraints.primarycolor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: ColorConstraints.secondarycolor,
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.03)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 0.04,
              ),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(children: [
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.021),
                  child: Text(
                    "Normal",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.051),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.021),
                  child: Text(
                    "${bmiController.bmiresult()}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.121,
                        fontWeight: FontWeight.bold,
                        color: ColorConstraints.primarycolor),
                  ),
                ),
                Text(
                  "",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ])),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ColorConstraints.primarycolor),
                  child: Text("Re-Calculate"),
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class BP extends StatefulWidget {
  const BP({Key? key}) : super(key: key);

  @override
  State<BP> createState() => _BPState();
}

class _BPState extends State<BP> {
  int systolic = 0;
  int diastolic = 0;
  int pulse = 0;
  TextEditingController _systolicBPController = TextEditingController();
  TextEditingController _diastolicBPController = TextEditingController();
  TextEditingController _pulseController = TextEditingController();

  double _result = 0.0;
  @override
  void test() {
    setState(() {
      systolic = int.parse(_systolicBPController.text);
      diastolic = int.parse(_diastolicBPController.text);
      pulse = int.parse(_pulseController.text);
      _result = (systolic + (2 * diastolic) + pulse) / 3;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Blood Pressure"),
          backgroundColor: ColorConstraints.primarycolor,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: FractionalOffset(0.5, 0.5),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.04,
                left: MediaQuery.of(context).size.width * 0.05,
                bottom: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Center(
                  child: Text(
                    "Systollic: ${systolic} mmHg",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Text("Diastoolic: ${diastolic}mmHg",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Text("Pulse: ${diastolic} mmHg",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Text("Mean: $_result Hg",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1),
                  child: TextField(
                    controller: _systolicBPController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Systolic BP',
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: _diastolicBPController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Diastolic BP',
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: _pulseController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Pulse',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorConstraints.primarycolor,
                        minimumSize: Size(
                            30, MediaQuery.of(context).size.height * 0.06)),
                    onPressed: () => test(),
                    child: Text(
                      "Check",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

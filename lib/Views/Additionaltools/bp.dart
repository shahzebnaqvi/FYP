import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medicalapp/Utils/color_constraints.dart';

class BP extends StatefulWidget {
  const BP({Key? key}) : super(key: key);

  @override
  State<BP> createState() => _BPState();
}

class _BPState extends State<BP> {
  String Systollic = "";
  String Diastoolic = "";
  String Pulse = "";
  @override
  void test() {
    setState(() {
      Systollic = '121';
      Diastoolic = '81';
      Pulse = '24';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Blood Pressure"),
          backgroundColor: ColorConstraints.primarycolor,
        ),
        body: Container(
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
              Center(
                  child: Center(
                child: Text(
                  'Grade 3 hypertension',
                  style: TextStyle(
                      color: ColorConstraints.secondarycolor,
                      fontSize: MediaQuery.of(context).size.width * 0.08),
                ),
              )),
              Divider(
                thickness: 1,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Center(
                child: Text(
                  "Systollic: ${Systollic} mmHg",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: Text("Diastoolic: ${Diastoolic}mmHg",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: Text("Pulse: ${Pulse} mmHg",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: Text("Mean: 126.33Hg",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.width * 0.1),
                child: TextField(
                  cursorColor: ColorConstraints.blackcolor,
                  decoration: InputDecoration(
                    labelText: 'Systolic',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.1),
                child: TextField(
                  cursorColor: ColorConstraints.blackcolor,
                  decoration: InputDecoration(
                    labelText: 'Diatolic',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.1),
                child: TextField(
                  cursorColor: ColorConstraints.blackcolor,
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
                      minimumSize:
                          Size(30, MediaQuery.of(context).size.height * 0.06)),
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
        ));
  }
}

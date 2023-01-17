import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:file_picker/file_picker.dart';
import 'package:medicalapp/Api/neo_analysis_api_post.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:medicalapp/Utils/file_contraints.dart';

class NeoAnalysis extends StatefulWidget {
  const NeoAnalysis({Key? key}) : super(key: key);

  @override
  State<NeoAnalysis> createState() => _NeoAnalysisState();
}

class _NeoAnalysisState extends State<NeoAnalysis> {
  var results;
  var circularbool = false;
  var output = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,

        backgroundColor: Colors.transparent,
        title: Image(
          image: AssetImage(
            FileConstraints.logo2s,
          ),
          width: 80,
        ),
        leading: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ColorConstraints.primarycolor,
        ),
        // backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      height: 320,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0Xff707070),
                        borderRadius: new BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      height: 250,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: results != null
                          ? Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  // image: FileImage(results.files.single.path),
                                  image: FileImage(
                                      File(results.files.single.path)),
                                  fit: BoxFit.cover,
                                ),
                                color: ColorConstraints.primarycolor,
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              // child: Image.file(
                              //   File(results.files.single.path),
                              // ),
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.75,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/neo.png"),
                                  fit: BoxFit.cover,
                                ),
                                color: ColorConstraints.primarycolor,
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.75,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.only(right: 30, left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // _pickFile();
                                    results = await FilePicker.platform
                                        .pickFiles(
                                            type: FileType.custom,
                                            allowMultiple: false,
                                            allowedExtensions: [
                                          'jpg',
                                          'jpeg',
                                          'png'
                                        ]);
                                    setState(() {
                                      results = results;
                                    });
                                  },
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/cam.png",
                                    ),
                                    // width: 80,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Start Scan",
                                    style: TextStyle(
                                        color: ColorConstraints.primarycolor,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Color(0Xff707070),
                  ),
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 40, left: 40),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/images/gall.png",
                        ),
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "25",
                          style: TextStyle(
                              color: ColorConstraints.primarycolor,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('$output', style: TextStyle(color: Colors.white)),
                ),
                circularbool == false
                    ? Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorConstraints.primarycolor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          icon: Image(
                            image: AssetImage(
                              "assets/images/File-01.png",
                            ),
                            height: 20,
                          ),
                          // style: ButtonStyle(
                          //   backgroundColor: MaterialStateProperty.all(ColorConstraints.primarycolor),
                          // ),
                          label: Center(child: Text("Generate File")),
                          onPressed: () {
                            setState(() {
                              circularbool = true;
                            });
                            neoAnalysis(results.files.single.path)
                                .then((value) {
                              print(value);

                              setState(() {
                                output = '${value['pulse_pred']}';
                                circularbool = false;
                              });
                            });
                          },
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    ColorConstraints.primarycolor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),

                            // style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(ColorConstraints.primarycolor),
                            // ),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: LinearProgressIndicator(
        color: Colors.blue,
      ),
    );
  }
}

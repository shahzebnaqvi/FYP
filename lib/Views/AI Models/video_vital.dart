import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicalapp/Api/video_vital_api_post.dart';
import 'package:medicalapp/Utils/file_contraints.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:medicalapp/Api/video_vital_api.dart';
import 'package:medicalapp/Utils/color_constraints.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'dart:io';

class VideoVitalScreen extends StatefulWidget {
  const VideoVitalScreen({Key? key}) : super(key: key);

  @override
  State<VideoVitalScreen> createState() => _VideoVitalScreenState();
}

class _VideoVitalScreenState extends State<VideoVitalScreen> {
  @override
  final List<ChartData> chartData1 = [];
  final List<ChartData> chartData2 = [];
  var results;
  var circularbool = false;
  var graph1 = [];
  var graph2 = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    videovitalapi().then((value) {
      setState(() {
        graph1 = value.pulsePred;
        graph2 = value.respPred;
        for (var i = 0; i < graph1.length; i++) {
          print(graph1[i]);
          chartData1.add(ChartData(i, graph1[i]));
          if (i == 20) {
            i = graph1.length;
          }
        }
        for (var i = 0; i < graph2.length; i++) {
          print(graph2[i]);
          chartData2.add(ChartData(i, graph2[i]));
          if (i == 20) {
            i = graph2.length;
          }
        }
      });

      print(graph1);
    });
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
  }

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
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorConstraints.primarycolor,
            )),
        // backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      height: 200,
                    ),
                    results != null
                        ? Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage("assets/images/person.png"),
                              //   fit: BoxFit.cover,
                              // ),
                              color: ColorConstraints.primarycolor,
                              borderRadius: new BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            height: 150,
                            child:
                                VideoApp(videolink: results.files.single.path))
                        : Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/person.png"),
                                fit: BoxFit.cover,
                              ),
                              color: ColorConstraints.primarycolor,
                              borderRadius: new BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            height: 150,
                          ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.only(right: 40, left: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                    "assets/images/stop.png",
                                  ),
                                  // width: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Stop",
                                    style: TextStyle(
                                        color: ColorConstraints.primarycolor,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
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
                                          'mp4',
                                        ]);
                                    setState(() {
                                      results = results;
                                    });
                                  },
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/record.png",
                                    ),
                                    // width: 80,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Start Recording",
                                    style: TextStyle(
                                        color: ColorConstraints.primarycolor,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                    "assets/images/upload.png",
                                  ),
                                  // width: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Load",
                                    style: TextStyle(
                                        color: ColorConstraints.primarycolor,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.pink.withOpacity(0.2),
                          ColorConstraints.primarycolor,
                        ],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: SfCartesianChart(
                            // plotAreaBorderColor: Colors.red,
                            // plotAreaBackgroundColor: Colors.red,
                            // borderColor: Colors.green,
                            // backgroundColor: Colors.green,
                            primaryXAxis: NumericAxis(
                              //Hide the gridlines of x-axis
                              majorGridLines: MajorGridLines(width: 0),
                              //Hide the axis line of x-axis
                              axisLine: AxisLine(width: 0),
                            ),
                            primaryYAxis: NumericAxis(
                                //Hide the gridlines of y-axis
                                majorGridLines: MajorGridLines(width: 0),
                                //Hide the axis line of y-axis
                                axisLine: AxisLine(width: 0)),
                            plotAreaBorderWidth: 0,
                            series: <ChartSeries>[
                              SplineSeries<ChartData, int>(
                                  dataSource: chartData1,
                                  // Dash values for spline
                                  color: Colors.pink,
                                  dashArray: <double>[5, 5],
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                            ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("72 BPM",
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 22)),
                          Text("Heart Rate",
                              style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue.withOpacity(0.2),
                          ColorConstraints.primarycolor,
                        ],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: SfCartesianChart(
                            // plotAreaBorderColor: Colors.red,
                            // plotAreaBackgroundColor: Colors.red,
                            // borderColor: Colors.green,
                            // backgroundColor: Colors.green,

                            primaryXAxis: NumericAxis(
                              //Hide the gridlines of x-axis
                              majorGridLines: MajorGridLines(width: 0),
                              //Hide the axis line of x-axis
                              axisLine: AxisLine(width: 0),
                            ),
                            primaryYAxis: NumericAxis(
                                //Hide the gridlines of y-axis
                                majorGridLines: MajorGridLines(width: 0),
                                //Hide the axis line of y-axis
                                axisLine: AxisLine(width: 0)),
                            plotAreaBorderWidth: 0,
                            series: <ChartSeries>[
                              SplineSeries<ChartData, int>(
                                  dataSource: chartData2,
                                  // Dash values for spline
                                  color: Colors.blue,
                                  dashArray: <double>[5, 5],
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                            ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("15 BPM",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 22)),
                          Text("Respiration Rate",
                              style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 8),
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //       borderRadius: new BorderRadius.all(
                //         Radius.circular(10.0),
                //       ),
                //       gradient: LinearGradient(
                //         begin: Alignment.topRight,
                //         end: Alignment.bottomLeft,
                //         colors: [
                //           Colors.green.withOpacity(0.2),
                //           baseColor,
                //         ],
                //       )),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         height: 100,
                //         width: MediaQuery.of(context).size.width * 0.55,
                //         child: SfCartesianChart(
                //             // plotAreaBorderColor: Colors.red,
                //             // plotAreaBackgroundColor: Colors.red,
                //             // borderColor: Colors.green,
                //             // backgroundColor: Colors.green,
                //             primaryXAxis: NumericAxis(
                //               //Hide the gridlines of x-axis
                //               majorGridLines: MajorGridLines(width: 0),
                //               //Hide the axis line of x-axis
                //               axisLine: AxisLine(width: 0),
                //             ),
                //             primaryYAxis: NumericAxis(
                //                 //Hide the gridlines of y-axis
                //                 majorGridLines: MajorGridLines(width: 0),
                //                 //Hide the axis line of y-axis
                //                 axisLine: AxisLine(width: 0)),
                //             plotAreaBorderWidth: 0,
                //             series: <ChartSeries>[
                //               SplineSeries<ChartData, int>(
                //                   dataSource: chartData1,
                //                   // Dash values for spline
                //                   color: Colors.green,
                //                   dashArray: <double>[5, 5],
                //                   xValueMapper: (ChartData data, _) => data.x,
                //                   yValueMapper: (ChartData data, _) => data.y)
                //             ]),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Text("140/78 Mmhg",
                //               style:
                //                   TextStyle(color: Colors.green, fontSize: 18)),
                //           Text("Blood Pressure",
                //               style: TextStyle(color: Colors.white)),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
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
                          //   backgroundColor: MaterialStateProperty.all(primaryColor),
                          // ),
                          label: Center(child: Text("Generate Report")),
                          onPressed: () {
                            setState(() {
                              circularbool = true;
                            });
                            videovital(results.files.single.path).then((value) {
                              print(value);
                              print("assaas");
                              print(value['pulse_pred']);
                              setState(() {
                                chartData1.clear();
                                chartData2.clear();
                                for (var i = 0;
                                    i < value['pulse_pred'].length;
                                    i++) {
                                  print(value['pulse_pred'][i]);
                                  chartData1.add(
                                      ChartData(i, value['pulse_pred'][i]));
                                  if (i == 20) {
                                    i = value['pulse_pred'].length;
                                  }
                                }
                                for (var i = 0;
                                    i < value['resp_pred'].length;
                                    i++) {
                                  print(value['resp_pred'][i]);
                                  chartData2
                                      .add(ChartData(i, value['resp_pred'][i]));
                                  if (i == 20) {
                                    i = value['resp_pred'].length;
                                  }
                                }
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
                            //   backgroundColor: MaterialStateProperty.all(primaryColor),
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

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key, required this.videolink}) : super(key: key);
  final String videolink;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    setState(() {});
    callvideo();
  }

  void callvideo() {
    setState(() {});

    _controller = VideoPlayerController.file(File(widget.videolink))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    callvideo();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:ml_kit_ocr/ml_kit_ocr.dart';

class OCRReportScreen extends StatefulWidget {
  const OCRReportScreen({Key? key}) : super(key: key);

  @override
  State<OCRReportScreen> createState() => _OCRReportScreenState();
}

class _OCRReportScreenState extends State<OCRReportScreen> {
  XFile? image;
  late File _image;
  String recognitions = '';
  bool isProcessing = false;
  Future getImagefromcamera() async {
    image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      image = image;
    });
  }

  Future getImagefromGallery() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('OCR Report Scan'),
        ),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            if (image != null)
              SizedBox(
                height: 200,
                width: 200,
                child: InteractiveViewer(
                  child: Image.file(
                    File(image!.path),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            if (recognitions.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText('Reports Text: $recognitions'),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    getImagefromGallery();
                    recognitions = '';
                    setState(() {});
                  },
                  child: const Text('Pick Image'),
                ),
                FloatingActionButton(
                  onPressed: () {
                    getImagefromcamera();
                  },
                  tooltip: "Pick Image form gallery",
                  child: Icon(Icons.add_a_photo),
                ),
                if (image != null)
                  isProcessing
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            recognitions = 'dd';
                            final ocr = MlKitOcr();
                            // isProcessing = true;
                            setState(() {});
                            print(recognitions);
                            final result = await ocr.processImage(
                                InputImage.fromFilePath(image!.path));

                            recognitions = '';
                            print(result.blocks);
// Iterate over TextBlocks
                            for (var blocks in result.blocks) {
                              print(blocks);
                              for (var lines in blocks.lines) {
                                print(lines);

                                for (var words in lines.elements) {
                                  print(recognitions);

                                  recognitions += words.text;
                                }
                              }
                            }
                            setState(() {});
                          },
                          child: const Text('Report from Image'),
                        ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => Login()));
                //   },
                //   child: Icon(Icons.add_a_photo),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future videovital(filename) async {
  // print(arrayvalue);
  // EasyLoading.show(
  //   status: 'Please wait...',
  //   maskType: EasyLoadingMaskType.black,
  // );
// , headers: headersaddspod
  var uri =
      'http://video-model-1-liveloadbalancer-2006731283.eu-south-1.elb.amazonaws.com/video_vital';
  var request = http.MultipartRequest('POST', Uri.parse(uri));

  request.files.add(new http.MultipartFile.fromBytes(
      'file', File(filename).readAsBytesSync(),
      filename: filename.split("/").last));

  print(filename);
  print(request);
  var res = await request.send();
  print("printndsnmmklmdl ${res}");
  // EasyLoading.dismiss();
  print(res.statusCode);
  if (res.statusCode == 200) {
    // var respond = await res.stream.bytesToString();

    final res1 = await http.Response.fromStream(res);

    print(res);
    print(res1.body);
    print("positive response");
    // EasyLoading.dismiss();

    return jsonDecode(res1.body);
  } else {
    // EasyLoading.dismiss();

    // throw Exception('Failed to load Users');
  }
}

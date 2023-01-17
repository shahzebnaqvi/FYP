import 'package:http/http.dart' as http;
import 'dart:convert';

Future videovitalapi() async {
  var url = Uri.parse(
      "http://backend-model-liveloadbalancer-1607118660.eu-south-1.elb.amazonaws.com/video_vital");
  var response = await http.get(url);
  var responseData = jsonDecode(response.body);

  return VideoVital.fromJson(responseData);
}

class VideoVital {
  List<double>? pulsePred;
  List<double>? respPred;

  VideoVital({this.pulsePred, this.respPred});

  VideoVital.fromJson(Map<String, dynamic> json) {
    pulsePred = json['pulse_pred'].cast<double>();
    respPred = json['resp_pred'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pulse_pred'] = this.pulsePred;
    data['resp_pred'] = this.respPred;
    return data;
  }
}

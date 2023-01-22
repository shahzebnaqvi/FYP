import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future uploadFile(String filepath, String folder, String filename) async {
    File file = File(filepath);
    try {
      var uploadimage = storage.ref().child('profiledoctor/$folder/$filename');
      await uploadimage.putFile(file);
      String url = (await uploadimage.getDownloadURL()).toString();
      return url;
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  // static Future<dynamic> LoadImage(BuildContext, String image) async {
  //   return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  // }
  Future<String> downloadedUrlsingle(String imageName) async {
    String downloadedUrl = await storage.ref('$imageName').getDownloadURL();
    return downloadedUrl;
  }

  Stream<String> downloadedUrl(String imageName) async* {
    String downloadedUrl = await storage.ref('$imageName').getDownloadURL();
    // 'profile/a@gmail.com/$imageName'
    yield downloadedUrl;
  }
}

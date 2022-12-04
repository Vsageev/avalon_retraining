import 'package:avanpost_retraining/requests/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class StorageRequests {
  static Future<String> addImage(Uint8List bytes) async {
    final body = {"imageUrl": bytes};

    // print(body);

    // final response = await http
    //     .post(Uri.https(host, '/api/save_photo/'), body: body, headers: {"Content-Type": "multipart/form-data"});

    // print(response);

    print('req');

    var dio = Dio();
    var formData = FormData.fromMap({'imageUrl': MultipartFile.fromBytes(bytes, filename: 'upload.png')});

    var response = await dio.post('http://127.0.0.1:8000/api/save_photo/', data: formData);

    print(response);

    // final uri = Uri.https(host, '/api/save_photo/');
    // var request = http.MultipartRequest('POST', uri);
    // final httpImage = http.MultipartFile.fromBytes(
    //   'billy.png',
    //   bytes,
    //   filename: 'billy.png',
    // );
    // request.files.add(httpImage);
    // final response = await request.send().then((response) {
    //   if (response.statusCode == 200) print("Uploaded!");
    // });

    return "";
  }
}

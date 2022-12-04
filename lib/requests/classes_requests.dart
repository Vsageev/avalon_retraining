import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:avanpost_retraining/pages/classes/class_preview_model.dart';
import 'package:avanpost_retraining/requests/constants.dart';

class ClassesRequests {
  static Future<List<ClassPreviewModel>> getClasses() async {
    final response = await http.get(Uri.http(host, '/api/categories'), headers: {"Content-Type": "application/json"});

    return ClassesResponse.fromJson(response.body).categories;
  }

  static Future<void> createClass(String name) async {
    final response = await http.post(
      Uri.http(host, '/api/categories/'),
      body: json.encode({"name": name}),
      headers: {"Content-Type": "application/json"},
    );

    return;
  }
}

class ClassesResponse {
  List<ClassPreviewModel> categories;
  ClassesResponse({
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return {
      'categories': categories.map((x) => x.toMap()).toList(),
    };
  }

  factory ClassesResponse.fromMap(Map<String, dynamic> map) {
    return ClassesResponse(
      categories: List<ClassPreviewModel>.from(map['categories']?.map((x) => ClassPreviewModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassesResponse.fromJson(String source) => ClassesResponse.fromMap(json.decode(source));
}

import 'dart:convert';

class ClassPreviewModel {
  String imageUrl;
  String name;

  ClassPreviewModel({
    required this.imageUrl,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
    };
  }

  factory ClassPreviewModel.fromMap(Map<String, dynamic> map) {
    return ClassPreviewModel(
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassPreviewModel.fromJson(String source) => ClassPreviewModel.fromMap(json.decode(source));
}

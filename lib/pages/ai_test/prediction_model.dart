import 'dart:convert';

class PredictionModel {
  String imageUrl;
  List<String> predictedClasses;
  PredictionModel({
    required this.imageUrl,
    required this.predictedClasses,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'prediction': predictedClasses,
    };
  }

  factory PredictionModel.fromMap(Map<String, dynamic> map) {
    return PredictionModel(
      imageUrl: map['imageUrl'] ?? '',
      predictedClasses: map['prediction'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PredictionModel.fromJson(String source) => PredictionModel.fromMap(json.decode(source));
}

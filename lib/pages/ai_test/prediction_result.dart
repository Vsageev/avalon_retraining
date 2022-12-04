import 'dart:convert';

import 'package:avanpost_retraining/pages/ai_test/prediction_model.dart';

class PredictionResult {
  List<PredictionModel> result;
  PredictionResult({
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'result': result.map((x) => x.toMap()).toList(),
    };
  }

  factory PredictionResult.fromMap(Map<String, dynamic> map) {
    return PredictionResult(
      result: List<PredictionModel>.from(map['result']?.map((x) => PredictionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PredictionResult.fromJson(String source) => PredictionResult.fromMap(json.decode(source));
}

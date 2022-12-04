import 'dart:convert';

import 'package:avanpost_retraining/pages/ai_test/prediction_model.dart';
import 'package:avanpost_retraining/requests/constants.dart';
import 'package:http/http.dart' as http;

class RecognitionRequests {
  static Future<List<PredictionModel>> recognise(List<String> images) async {
    final body = {"data": images.join(",")};

    final response = await http
        .post(Uri.https(host, '/api/start_neuro/'), body: body, headers: {"Content-Type": "application/json"});

    print(response);

    final jsonRez = json.decode(response.body) as Map<String, List<String>>;

    List<PredictionModel> preds = [];

    jsonRez.forEach((key, value) {
      preds.add(PredictionModel(imageUrl: key, predictedClasses: value));
    });

    return preds;
  }
}

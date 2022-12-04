import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:avanpost_retraining/pages/ai_test/prediction_model.dart';

abstract class AiTestState {}

class ImagesLoading extends AiTestState {
  List<Image> images;
  List<Uint8List> bytes;
  ImagesLoading({required this.images, required this.bytes});
}

class RecognitionResultsLoading extends AiTestState {}

class RecognitionResultsLoaded extends AiTestState {
  List<PredictionModel> predictions;
  RecognitionResultsLoaded({
    required this.predictions,
  });
}

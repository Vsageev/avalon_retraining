import 'package:avanpost_retraining/pages/ai_test/prediction_model.dart';
import 'package:avanpost_retraining/pages/ai_test/prediction_result.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_object.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/picture_view.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/view_switch.dart';
import 'package:avanpost_retraining/shared/colors.dart';
import 'package:flutter/material.dart';

enum ResultViewType { picture, json }

class RecognitionResultsScreen extends StatefulWidget {
  const RecognitionResultsScreen({super.key, required this.predictions});

  final List<PredictionModel> predictions;

  @override
  State<RecognitionResultsScreen> createState() => _RecognitionResultsScreenState();
}

class _RecognitionResultsScreenState extends State<RecognitionResultsScreen> {
  ResultViewType view = ResultViewType.picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          ViewSwitch(
            viewType: view,
            onChange: (newType) {
              setState(() {
                view = newType;
              });
            },
          ),
          Expanded(
            child: view == ResultViewType.picture
                ? PictureView(predictions: widget.predictions)
                : SingleChildScrollView(
                    child: JsonObject(object: PredictionResult(result: widget.predictions).toMap(), offset: 0),
                  ),
          ),
        ],
      ),
    );
  }
}

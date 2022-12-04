import 'package:avanpost_retraining/pages/ai_test/prediction_model.dart';
import 'package:avanpost_retraining/shared/colors.dart';
import 'package:flutter/material.dart';

class PictureView extends StatelessWidget {
  const PictureView({super.key, required this.predictions});

  final List<PredictionModel> predictions;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, childAspectRatio: 0.8, crossAxisSpacing: 5, mainAxisSpacing: 5),
      itemCount: predictions.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          color: CustomColors.background,
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  predictions[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(height: 5),
              SizedBox(
                height: 50,
                child: Text(
                  predictions[index].predictedClasses.join(', '),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'dart:math';

import 'package:avanpost_retraining/shared/colors.dart';
import 'package:flutter/material.dart';

class RecognitionResultsWaitingScreen extends StatefulWidget {
  const RecognitionResultsWaitingScreen({super.key});

  @override
  State<RecognitionResultsWaitingScreen> createState() => _RecognitionResultsWaitingScreenState();
}

class _RecognitionResultsWaitingScreenState extends State<RecognitionResultsWaitingScreen> {
  String currentText = "Распознаём...";

  final options = [
    "Распознаём...",
    "Это может занять какое-то время",
    "Можете пока заварить чай",
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      changeText();
    });
  }

  changeText() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    while (true) {
      String newText;

      do {
        newText = options[Random().nextInt(3)];
      } while (newText == currentText);

      if (mounted) {
        setState(() {
          currentText = newText;
        });
      }

      await Future.delayed(const Duration(milliseconds: 3000));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "assets/loader.gif",
          height: 400,
          width: 400,
        ),
        Text(
          currentText,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: CustomColors.brightAccent,
          ),
        ),
      ],
    );
  }
}

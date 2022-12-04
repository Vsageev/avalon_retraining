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
          "https://firebasestorage.googleapis.com/v0/b/avalon-b1d6a.appspot.com/o/loader.gif?alt=media&token=cf4bd0ba-8a07-4753-ad04-701ae43d369d",
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

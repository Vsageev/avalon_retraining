import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_styles.dart';
import 'package:flutter/material.dart';

class JsonStringParam extends StatelessWidget {
  const JsonStringParam(
      {super.key, required this.offset, required this.param, required this.value, this.addComma = false});

  final int offset;
  final String param;
  final String value;
  final bool addComma;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: jsonDecoration,
      padding: jsonPadding,
      child: Row(
        children: [
          Text(jsonOffset * offset),
          Expanded(
            child: Text(
              '"$param": "$value"${addComma ? ',' : ''}',
              overflow: TextOverflow.ellipsis,
              style: jsonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

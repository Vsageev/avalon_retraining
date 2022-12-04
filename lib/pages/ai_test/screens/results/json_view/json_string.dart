import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_styles.dart';
import 'package:flutter/material.dart';

class JsonString extends StatelessWidget {
  const JsonString({super.key, required this.offset, required this.value, this.addComma = false});

  final int offset;
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
              '"$value"${addComma ? ',' : ''}',
              overflow: TextOverflow.ellipsis,
              style: jsonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

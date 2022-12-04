import 'dart:convert';

import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_object.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_string.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JsonListParam extends StatefulWidget {
  const JsonListParam(
      {super.key, required this.array, required this.paramName, required this.offset, this.addComma = false});

  final int offset;
  final String paramName;
  final List array;
  final bool addComma;

  @override
  State<JsonListParam> createState() => _JsonListParamState();
}

class _JsonListParamState extends State<JsonListParam> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    if (!opened) {
      return GestureDetector(
        onTap: () {
          setState(() {
            opened = true;
          });
        },
        child: Container(
          decoration: jsonDecoration,
          padding: jsonPadding,
          child: Row(
            children: [
              Text(
                jsonOffset * widget.offset,
                overflow: TextOverflow.ellipsis,
                style: jsonTextStyle,
              ),
              const Icon(Icons.expand_more),
              Expanded(
                child: Text(
                  '"${widget.paramName}": ${json.encode(widget.array)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: jsonTextStyle,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.array.length + 3,
      itemBuilder: (context, i) {
        if (i == 0) {
          return GestureDetector(
            onTap: () {
              setState(() {
                opened = false;
              });
            },
            child: Container(
              decoration: jsonDecoration,
              padding: jsonPadding,
              child: Row(
                children: [
                  Text(
                    jsonOffset * widget.offset,
                    style: jsonTextStyle,
                  ),
                  const Icon(Icons.expand_less),
                  Text(
                    '"${widget.paramName}":',
                    style: jsonTextStyle,
                  ),
                ],
              ),
            ),
          );
        }
        if (i == 1) {
          return Container(
            decoration: jsonDecoration,
            padding: jsonPadding,
            child: Text(
              '${jsonOffset * widget.offset}      [',
              style: jsonTextStyle,
            ),
          );
        }
        if (i == widget.array.length + 2) {
          return Container(
            decoration: jsonDecoration,
            padding: jsonPadding,
            child: Text(
              '${jsonOffset * widget.offset}      ]${widget.addComma ? ',' : ''}',
              style: jsonTextStyle,
            ),
          );
        }
        if (widget.array[i - 2] is Map<String, dynamic>) {
          return JsonObject(
            object: widget.array[i - 2],
            offset: widget.offset + 1,
            addComma: i != (widget.array.length + 1),
          );
        }
        if (widget.array[i - 2] is String) {
          return JsonString(
            value: widget.array[i - 2],
            offset: widget.offset + 1,
            addComma: i != (widget.array.length + 1),
          );
        }
        return Container();
      },
    );
  }
}

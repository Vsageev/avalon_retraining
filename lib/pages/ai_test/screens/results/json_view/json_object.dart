import 'dart:convert';

import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_list_param.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_string_param.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/json_view/json_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JsonObject extends StatefulWidget {
  const JsonObject({super.key, required this.object, required this.offset, this.addComma = false});

  final int offset;
  final Map<String, dynamic> object;
  final bool addComma;

  @override
  State<JsonObject> createState() => _JsonObjectState();
}

class _JsonObjectState extends State<JsonObject> {
  List<String> keys = [];
  List<dynamic> values = [];

  bool opened = false;

  @override
  void initState() {
    opened = widget.offset == 0 ? true : false;
    keys = widget.object.keys.toList();
    values = widget.object.values.toList();

    super.initState();
  }

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
                  json.encode(widget.object),
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
      itemCount: widget.object.length + 2,
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
                  const Text(
                    '{',
                    style: jsonTextStyle,
                  ),
                ],
              ),
            ),
          );
        }
        if (i == widget.object.length + 1) {
          return Container(
            decoration: jsonDecoration,
            padding: jsonPadding,
            child: Text(
              '${jsonOffset * widget.offset}      }${widget.addComma ? ',' : ''}',
              style: jsonTextStyle,
            ),
          );
        }
        if (values[i - 1] is String) {
          return JsonStringParam(
            offset: widget.offset + 1,
            param: keys[i - 1],
            value: values[i - 1],
            addComma: i != widget.object.length,
          );
        }
        if (values[i - 1] is List) {
          return JsonListParam(
            offset: widget.offset + 1,
            array: values[i - 1],
            paramName: keys[i - 1],
            addComma: i != widget.object.length,
          );
        }
        return Container();
      },
    );
  }
}

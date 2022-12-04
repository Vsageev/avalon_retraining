import 'package:avanpost_retraining/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {Key? key, required this.hint, required this.controller, this.hidden = false, this.autofillHints})
      : super(key: key);

  final bool hidden;
  final String hint;
  final TextEditingController controller;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.searchbar,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: hidden,
              autofillHints: autofillHints,
              maxLines: 1,
              controller: controller,
              style: const TextStyle(fontSize: 16, color: CustomColors.text, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 22.4, bottom: 18.4, top: 18.4),
                hintText: hint,
                hintStyle: const TextStyle(
                  color: CustomColors.hint,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

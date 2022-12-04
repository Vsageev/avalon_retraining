import 'package:avanpost_retraining/shared/colors.dart';
import 'package:avanpost_retraining/shared/widgets/button.dart';
import 'package:avanpost_retraining/shared/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class AddClassPopup extends StatefulWidget {
  AddClassPopup({super.key});

  @override
  State<AddClassPopup> createState() => _AddClassPopupState();
}

class _AddClassPopupState extends State<AddClassPopup> {
  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Container(
              height: 300,
              width: 450,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Новый класс',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(height: 50),
                  CustomTextForm(hint: 'Название', controller: controller),
                  const Expanded(child: SizedBox.shrink()),
                  controller.text.isNotEmpty
                      ? Button(
                          borderRadius: 3,
                          child: const Center(
                            child: Text(
                              'Добавить',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context, controller.text);
                          },
                        )
                      : Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Center(
                            child: Text(
                              'Добавить',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

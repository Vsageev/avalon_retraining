import 'package:avanpost_retraining/pages/ai_test/ai_test_cubit.dart';
import 'package:avanpost_retraining/shared/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class ImagesLoadScreeen extends StatefulWidget {
  const ImagesLoadScreeen({super.key, required this.imageUrls});

  final List<Image> imageUrls;

  @override
  State<ImagesLoadScreeen> createState() => _ImagesLoadScreeenState();
}

class _ImagesLoadScreeenState extends State<ImagesLoadScreeen> {
  bool hovered = false;

  late DropzoneViewController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropzoneView(
          onCreated: (controller) => this.controller = controller,
          onHover: () {
            setState(() {
              hovered = true;
            });
          },
          onDropMultiple: (ev) {
            setState(() {
              hovered = false;
            });

            BlocProvider.of<AiTestCubit>(context).pickDroped(ev ?? [], controller);
          },
          onLeave: () {
            setState(() {
              hovered = false;
            });
          },
        ),
        GridView.builder(
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150, childAspectRatio: 1, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemCount: widget.imageUrls.length + 1,
          itemBuilder: (BuildContext ctx, index) {
            if (index == 0) {
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<AiTestCubit>(context).pickImages();
                  },
                  child: Center(
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(3), color: CustomColors.brightAccent),
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.upload,
                              size: 35,
                              color: Colors.white,
                            ),
                            Container(height: 10),
                            const Text(
                              'Загрузить фото',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return Container(
              height: 1000,
              color: CustomColors.searchbar,
              child: widget.imageUrls[index - 1],
            );
          },
        ),
        if (hovered)
          Container(
            padding: const EdgeInsets.all(30),
            color: CustomColors.backgroundAccent.withAlpha(200),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: DottedBorder(
                dashPattern: const [30, 15],
                borderType: BorderType.RRect,
                strokeWidth: 5,
                radius: const Radius.circular(30),
                color: CustomColors.backgroundAccent,
                padding: const EdgeInsets.all(0),
                strokeCap: StrokeCap.round,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.image,
                        size: 75,
                        color: CustomColors.backgroundAccent,
                      ),
                      Container(height: 10),
                      const Text(
                        'Загрузить фото',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.backgroundAccent,
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

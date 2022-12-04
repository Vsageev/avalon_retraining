import 'package:avanpost_retraining/pages/ai_test/ai_test_cubit.dart';
import 'package:avanpost_retraining/pages/ai_test/ai_test_states.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/images_load_screen.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/recognition_result_waiting_screen.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/recognition_results_screen.dart';
import 'package:avanpost_retraining/shared/widgets/button.dart';
import 'package:avanpost_retraining/shared/widgets/navigated_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiTestPage extends StatelessWidget {
  const AiTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiTestCubit, AiTestState>(
      builder: (context, state) {
        if (state is ImagesLoading) {
          return NavigatedPage(
            currentPageType: PageType.aiTest,
            actions: state.images.isEmpty
                ? null
                : [
                    Button(
                      borderRadius: 3,
                      padding: const EdgeInsets.all(9),
                      child: Row(
                        children: const [
                          Text(
                            'Распознать',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_right_alt,
                            size: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onTap: () {
                        BlocProvider.of<AiTestCubit>(context).sendImagesToRecognition();
                      },
                    ),
                  ],
            body: ImagesLoadScreeen(
              imageUrls: state.images,
            ),
          );
        }
        if (state is RecognitionResultsLoading) {
          return const NavigatedPage(currentPageType: PageType.aiTest, body: RecognitionResultsWaitingScreen());
        }
        if (state is RecognitionResultsLoaded) {
          return NavigatedPage(
            currentPageType: PageType.aiTest,
            body: RecognitionResultsScreen(predictions: state.predictions),
          );
        }
        return NavigatedPage(
          currentPageType: PageType.aiTest,
          body: Container(),
        );
      },
    );
  }
}

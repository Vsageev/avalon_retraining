import 'package:avanpost_retraining/pages/ai_test/ai_test_cubit.dart';
import 'package:avanpost_retraining/pages/ai_test/screens/results/recognition_results_screen.dart';
import 'package:avanpost_retraining/shared/colors.dart';
import 'package:avanpost_retraining/shared/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewSwitch extends StatelessWidget {
  const ViewSwitch({super.key, required this.viewType, required this.onChange});

  final ResultViewType viewType;
  final Function(ResultViewType) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Container(width: 10),
              const Text(
                'Вид:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 45),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    onChange(ResultViewType.picture);
                  },
                  child: const Text(
                    'Карточки',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    onChange(ResultViewType.json);
                  },
                  child: const Text(
                    'JSON',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
              Button(
                borderRadius: 3,
                padding: const EdgeInsets.all(9),
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: const [
                    Text(
                      'Сохранить JSON',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.download,
                      size: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
                onTap: () {
                  BlocProvider.of<AiTestCubit>(context).saveResults();
                },
              ),
            ],
          ),
          Row(
            children: [
              Container(height: 5, width: 95, color: Colors.grey[200]),
              Container(
                height: 5,
                width: 99,
                color: viewType == ResultViewType.picture ? CustomColors.brightAccent : Colors.grey[400],
              ),
              Container(
                height: 5,
                width: 60,
                color: viewType == ResultViewType.json ? CustomColors.brightAccent : Colors.grey[400],
              ),
              Expanded(
                child: Container(height: 5, width: 95, color: Colors.grey[200]),
              )
            ],
          ),
        ],
      ),
    );
  }
}

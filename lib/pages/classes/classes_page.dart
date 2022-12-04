import 'package:avanpost_retraining/pages/classes/add_class_popup.dart';
import 'package:avanpost_retraining/pages/classes/classes_cubit.dart';
import 'package:avanpost_retraining/pages/classes/classes_states.dart';
import 'package:avanpost_retraining/shared/colors.dart';
import 'package:avanpost_retraining/shared/widgets/navigated_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigatedPage(
      currentPageType: PageType.classes,
      body: Container(
        color: Colors.grey[200],
        child: BlocBuilder<ClassesCubit, ClassesState>(
          builder: (context, state) {
            if (state is ClassesLoaded) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200, childAspectRatio: 0.8, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemCount: state.models.length + 1,
                itemBuilder: (BuildContext ctx, index) {
                  if (index == 0) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AddClassPopup(),
                          ).then((value) {
                            if (value is String) {
                              BlocProvider.of<ClassesCubit>(context).addClass(value);
                            }
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomColors.brightAccent, width: 5),
                            borderRadius: BorderRadius.circular(3),
                            color: CustomColors.brightAccent,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(height: 10),
                                const Text(
                                  'Добавить класс',
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
                    );
                  }
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            fit: BoxFit.cover,
                            state.models[index - 1].imageUrl,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            state.models[index - 1].name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

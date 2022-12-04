import 'package:avanpost_retraining/pages/classes/class_preview_model.dart';
import 'package:avanpost_retraining/pages/classes/classes_states.dart';
import 'package:avanpost_retraining/requests/classes_requests.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesCubit extends Cubit<ClassesState> {
  ClassesCubit() : super(ClassesLoading()) {
    getCategories();
  }

  getCategories() async {
    final cats = await ClassesRequests.getClasses();

    emit(ClassesLoaded(models: cats));
  }

  addClass(String className) {
    if (state is ClassesLoaded) {
      emit(
        ClassesLoaded(
          models: (state as ClassesLoaded).models +
              [
                ClassPreviewModel(
                  imageUrl: 'assets/placeholder.jpg',
                  name: className,
                ),
              ],
        ),
      );
    }
  }
}

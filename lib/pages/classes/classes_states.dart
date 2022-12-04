import 'package:avanpost_retraining/pages/classes/class_preview_model.dart';

abstract class ClassesState {}

class ClassesLoading extends ClassesState {}

class ClassesLoaded extends ClassesState {
  List<ClassPreviewModel> models;
  ClassesLoaded({
    required this.models,
  });
}

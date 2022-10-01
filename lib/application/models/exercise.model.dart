import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.model.freezed.dart';

part 'exercise.model.g.dart';

@freezed
abstract class ExerciseModel with _$ExerciseModel {
  factory ExerciseModel({
    required String uid,
    required int steps,
    required int points,
    required int consumedTime,
    required String createdAt,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);
}

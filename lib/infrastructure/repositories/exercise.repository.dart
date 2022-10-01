import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/exercise.model.dart';

import '/core/common_imports.dart';
import '/infrastructure/data_sources/remote/exercise.datasource.dart';

final exerciseRepositoryProvider = Provider<ExerciseRepository>((ref) =>
    ExerciseRepositoryImpl(
        exerciseDataSource: ref.watch(exerciseDataSourceProvider)));

abstract class ExerciseRepository {
  Future<void> createOrUpdateExerciseRecord(
      {required String uid, int steps = 0});
  Stream<int> getTotalExercisesSteps({required String uid});
  Stream<ExerciseModel> getExerciseRecordPerDay({required String uid});
}

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseDataSource exerciseDataSource;

  ExerciseRepositoryImpl({required this.exerciseDataSource});

  @override
  Future<void> createOrUpdateExerciseRecord(
      {required String uid, int steps = 0}) async {
    await Result.guardFuture(() => exerciseDataSource
        .createOrUpdateExerciseRecord(uid: uid, steps: steps));
  }

  @override
  Stream<int> getTotalExercisesSteps({required String uid}) {
    return exerciseDataSource.getTotalExercisesSteps(uid: uid);
  }

  @override
  Stream<ExerciseModel> getExerciseRecordPerDay({required String uid}) {
    return exerciseDataSource.getExerciseRecordPerDay(uid: uid);
  }
}

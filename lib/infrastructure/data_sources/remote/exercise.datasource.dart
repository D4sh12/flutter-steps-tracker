import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/exercise.model.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/core/utils/helpers/calculations.dart';

final exerciseDataSourceProvider = Provider<ExerciseDataSource>(
  (ref) => ExerciseDataSourceImpl(
    database: ref.watch(fireStoreProvider),
  ),
);

abstract class ExerciseDataSource {
  Future<void> createOrUpdateExerciseRecord(
      {required String uid, int steps = 0});
  Stream<int> getTotalExercisesSteps({required String uid});
  Stream<ExerciseModel> getExerciseRecordPerDay({required String uid});
}

class ExerciseDataSourceImpl implements ExerciseDataSource {
  final FirebaseFirestore database;

  ExerciseDataSourceImpl({required this.database});

  @override
  Future<void> createOrUpdateExerciseRecord(
      {required String uid, int steps = 0}) async {
    final date = DateTime.now();
    final dateFormate = "${date.year}-${date.month}-${date.day}";

    final records = await database
        .collection('exercise')
        .where("uid", isEqualTo: uid)
        .where("createdAt", isEqualTo: dateFormate)
        .get();

    if (records.docs.isNotEmpty) {
      final exercise = ExerciseModel.fromJson(records.docs.first.data());
      database.collection('exercise').doc(records.docs.first.id).update(
            exercise
                .copyWith(
                  steps: exercise.steps + steps,
                  consumedTime: getMinOverSteps(exercise.steps + steps),
                  points: getPointsOverSteps(exercise.steps + steps),
                )
                .toJson(),
          );
    } else {
      database.collection('exercise').doc().set(
            ExerciseModel(
              uid: uid,
              steps: steps,
              points: getPointsOverSteps(steps),
              consumedTime: getMinOverSteps(steps),
              createdAt: dateFormate,
            ).toJson(),
          );
    }
  }

  @override
  Stream<int> getTotalExercisesSteps({required String uid}) {
    return database
        .collection('exercise')
        .where("uid", isEqualTo: uid)
        .snapshots()
        .map((event) {
      int totalSteps = 0;
      // ignore: avoid_function_literals_in_foreach_calls
      event.docs.forEach((e) {
        final data = ExerciseModel.fromJson(e.data());
        totalSteps += data.steps;
      });
      return totalSteps;
    });
  }

  @override
  Stream<ExerciseModel> getExerciseRecordPerDay({required String uid}) {
    final date = DateTime.now();
    final dateFormate = "${date.year}-${date.month}-${date.day}";

    return database
        .collection('exercise')
        .where("uid", isEqualTo: uid)
        .where("createdAt", isEqualTo: dateFormate)
        .snapshots()
        .map((event) {
      if (event.docs.isNotEmpty) {
        return ExerciseModel.fromJson(event.docs.first.data());
      }
      return ExerciseModel(
          uid: '', steps: 0, points: 0, consumedTime: 0, createdAt: '');
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/exercise.model.dart';
import 'package:steps_tracker_flutter/application/models/user.model.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/core/utils/helpers/calculations.dart';

final pedometerDataSourceProvider = Provider<PedometerDataSource>(
  (ref) => PedometerDataSourceImpl(
    database: ref.watch(fireStoreProvider),
  ),
);

abstract class PedometerDataSource {
  Future<void> updateTotalSteps({required String uid, required int steps});
  Future<int> getUserTotalSteps({required String uid});
  Future<int> getUserTotalHealthPoints({required String uid});
  Future<int> getStepsPerDay({required String uid});
  Future<void> updateHealthPoints(
      {required String uid, required int healthPoints});
}

const String userCollection = 'user';
const String exerciseCollection = 'exercise';

class PedometerDataSourceImpl implements PedometerDataSource {
  final FirebaseFirestore database;

  PedometerDataSourceImpl({required this.database});

  @override
  Future<void> updateHealthPoints(
      {required String uid, required int healthPoints}) async {
    final data = {"healthPoints": healthPoints};
    await database.collection(userCollection).doc(uid).update(data);
  }

  /// update user's total steps field, by adding a newer step count value to the old val,
  /// and since updating the steps effects health points, it must get updated.
  @override
  Future<void> updateTotalSteps(
      {required String uid, required int steps}) async {
    final userData = await database.collection(userCollection).doc(uid).get();
    final userModel = UserModel.fromJson(userData.data()!);
    await database
        .collection(userCollection)
        .doc(uid)
        .update({"totalSteps": steps + userModel.totalSteps!});

    await updateHealthPoints(
        uid: uid,
        healthPoints: getPointsOverSteps(steps + userModel.totalSteps!));
  }

  @override
  Future<int> getStepsPerDay({required String uid}) {
    final date = DateTime.now();
    final dateFormate = "${date.year}-${date.month}-${date.day}";

    return database
        .collection(exerciseCollection)
        .where("uid", isEqualTo: uid)
        .where("createdAt", isEqualTo: dateFormate)
        .snapshots()
        .first
        .then((value) {
      if (value.docs.isNotEmpty) {
        final data = ExerciseModel.fromJson(value.docs.first.data());
        return data.steps;
      }
      return 0;
    });
  }

  @override
  Future<int> getUserTotalSteps({required String uid}) {
    return database
        .collection(userCollection)
        .doc(uid)
        .snapshots()
        .first
        .then((value) {
      final data = UserModel.fromJson(value.data()!);
      return data.totalSteps!;
    });
  }

  @override
  Future<int> getUserTotalHealthPoints({required String uid}) {
    return database
        .collection(userCollection)
        .doc(uid)
        .snapshots()
        .first
        .then((value) {
      final data = UserModel.fromJson(value.data()!);
      return data.healthPoints;
    });
  }
}

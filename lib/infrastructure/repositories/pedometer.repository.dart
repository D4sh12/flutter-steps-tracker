import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/infrastructure/data_sources/remote/pedometer.datasource.dart';

final pedometerRepositoryProvider = Provider<PedometerRepository>(
  (ref) => PedometerRepositoryImpl(
    pedometerDataSource: ref.watch(pedometerDataSourceProvider),
  ),
);

abstract class PedometerRepository {
  Future<int> getUserTotalSteps({required String uid});
  Future<int> getUserTotalHealthPoints({required String uid});
  Future<int> getStepsPerDay({required String uid});
  Future<void> updateTotalSteps({required String uid, required int steps});
    Future<void> updateHealthPoints(
      {required String uid, required int healthPoints});
}

class PedometerRepositoryImpl implements PedometerRepository {
  final PedometerDataSource pedometerDataSource;

  PedometerRepositoryImpl({required this.pedometerDataSource});

  @override
  Future<int> getUserTotalHealthPoints({required String uid}) async {
    return pedometerDataSource.getUserTotalHealthPoints(uid: uid);
  }

  @override
  Future<int> getUserTotalSteps({required String uid}) async {
    return pedometerDataSource.getUserTotalSteps(uid: uid);
  }

  @override
  Future<int> getStepsPerDay({required String uid}) async {
    return pedometerDataSource.getStepsPerDay(uid: uid);
  }

  @override
  Future<void> updateTotalSteps(
      {required String uid, required int steps}) async {
    return pedometerDataSource.updateTotalSteps(uid: uid, steps: steps);
  }
  
  @override
  Future<void> updateHealthPoints({required String uid, required int healthPoints}) async{
    return pedometerDataSource.updateHealthPoints(uid: uid, healthPoints: healthPoints);
  }
}

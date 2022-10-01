import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/pedometer.dart';

final pedometerServiceProvider = Provider<PedometerService>(
  ((ref) => PedometerService()),
);

class PedometerService {
  int _oldStepsCount = 0;

  PedometerService();

  // call it before start listening to new steps
  Future<void> init() async {
    _oldStepsCount =
        await Pedometer.stepCountStream.first.then((value) => value.steps);
  }

  Stream<int> get newSteps {
    return Pedometer.stepCountStream.map(
      (event) {
        if (_oldStepsCount == 0) return 1;
        final newSteps = event.steps - _oldStepsCount;
        _oldStepsCount = event.steps;
        return newSteps;
      },
    ).where(
      (e) => e != 0,
    );
  }
}

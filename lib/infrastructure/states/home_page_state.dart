import 'package:steps_tracker_flutter/application/models/exercise.model.dart';
import 'package:steps_tracker_flutter/application/models/user.model.dart';

class HomePageState {
  final UserModel userModel;
  final ExerciseModel exerciseModel;

  const HomePageState({required this.userModel, required this.exerciseModel});

  factory HomePageState.initial() {
    return HomePageState(
      userModel: UserModel(fullName: '', uid: '', healthPoints: 0),
      exerciseModel: ExerciseModel(
          consumedTime: 0, steps: 0, points: 0, createdAt: '', uid: ''),
    );
  }

  HomePageState copyWith({
    UserModel? userModel,
    ExerciseModel? exerciseModel,
  }) {
    return HomePageState(
      userModel: userModel ?? this.userModel,
      exerciseModel: exerciseModel ?? this.exerciseModel,
    );
  }
}

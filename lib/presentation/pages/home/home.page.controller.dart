import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/core/services/pedometer.service.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/exercise.repository.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/pedometer.repository.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/user.repository.dart';
import 'package:steps_tracker_flutter/infrastructure/states/home_page_state.dart';

final homePageControllerProvider =
    StateNotifierProvider<HomePageController, HomePageState>(
  (ref) => HomePageController(
    authState: ref.watch(firebaseAuthProvider),
    userRepository: ref.watch(userRepositoryProvider),
    pedometerService: ref.watch(pedometerServiceProvider),
    pedometerRepository: ref.watch(pedometerRepositoryProvider),
    exerciseRepository: ref.watch(exerciseRepositoryProvider),
  )..init(),
);

class HomePageController extends StateNotifier<HomePageState> {
  final FirebaseAuth authState;
  final UserRepository userRepository;
  final PedometerService pedometerService;
  final PedometerRepository pedometerRepository;
  final ExerciseRepository exerciseRepository;
  HomePageController(
      {required this.exerciseRepository,
      required this.userRepository,
      required this.pedometerRepository,
      required this.pedometerService,
      required this.authState})
      : super(HomePageState.initial());

  void init() {
    stepsTracker();
    userRepository
        .getUserProfile(uid: authState.currentUser!.uid)
        .listen((data) {
      debugPrint(data.fullName);
      state = state.copyWith(userModel: data);
    });
    exerciseRepository
        .getExerciseRecordPerDay(uid: authState.currentUser!.uid)
        .listen((data) {
      state = state.copyWith(exerciseModel: data);
    });
  }

  void stepsTracker() {
    pedometerService.newSteps.listen((steps) async {
      //? update exercise record or create new one
      await exerciseRepository.createOrUpdateExerciseRecord(
          uid: authState.currentUser!.uid, steps: steps);
      //? Update user's total steps count
      await pedometerRepository.updateTotalSteps(
          uid: authState.currentUser!.uid, steps: steps);
    });
  }
}

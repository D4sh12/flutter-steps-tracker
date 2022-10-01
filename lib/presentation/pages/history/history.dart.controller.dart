import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/history.model.dart';
import 'package:steps_tracker_flutter/core/services/firebase.services.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/reward.repository.dart';

final historyPageControllerProvider = StateNotifierProvider<
    HistoryPageController, AsyncValue<List<HistoryModel>>>(
  (ref) => HistoryPageController(
    auth: ref.watch(firebaseAuthProvider),
    rewardRepository: ref.watch(rewardRepositoryProvider),
  )..getHistoryList(),
);

class HistoryPageController
    extends StateNotifier<AsyncValue<List<HistoryModel>>> {
  final RewardRepository rewardRepository;
  final FirebaseAuth auth;
  HistoryPageController({required this.rewardRepository, required this.auth})
      : super(const AsyncLoading());

  void getHistoryList() {
    rewardRepository.getHistoryList(uid: auth.currentUser!.uid).then(
      (value) {
        value.when(
            success: (data) => state = AsyncData(data),
            failure: (error) => state = AsyncError(error));
      },
    );
  }
}

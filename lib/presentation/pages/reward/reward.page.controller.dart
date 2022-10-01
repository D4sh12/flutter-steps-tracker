import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/reward.model.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/pedometer.repository.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/reward.repository.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/user.repository.dart';
import 'package:steps_tracker_flutter/presentation/widgets/toast.dart';

final rewardPageControllerProvider =
    StateNotifierProvider<RewardPageController, AsyncValue<List<RewardModel>>>(
  (ref) => RewardPageController(
    rewardRepository: ref.watch(rewardRepositoryProvider),
    pedometerRepository: ref.watch(pedometerRepositoryProvider),
  )..getRewardList(),
);

class RewardPageController
    extends StateNotifier<AsyncValue<List<RewardModel>>> {
  final RewardRepository rewardRepository;
  final PedometerRepository pedometerRepository;
  RewardPageController(
      {required this.pedometerRepository, required this.rewardRepository})
      : super(const AsyncLoading());

  void getRewardList() {
    rewardRepository.getRewardList().then(
      (value) {
        value.when(
            success: (data) => state = AsyncData(data),
            failure: (error) => state = AsyncError(error));
      },
    );
  }

  void buyItem({
    required int healthPoint,
    required String uid,
    required String title,
    required int cost,
  }) {
    if (healthPoint >= cost) {
      rewardRepository.buyItem(uid: uid, itemName: title, cost: cost).then(
            (value) => value.when(
              success: (data) async {
                await pedometerRepository.updateHealthPoints(
                    uid: uid, healthPoints: healthPoint - cost);
                showToast(msg: 'Congrats! you earned a new rewared');
              },
              failure: (error) {
                showToast(msg: error);
              },
            ),
          );
    } else {
      showToast(msg: 'No enugh health points');
    }
  }
}

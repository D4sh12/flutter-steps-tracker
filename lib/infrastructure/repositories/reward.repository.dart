import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/history.model.dart';
import 'package:steps_tracker_flutter/application/models/reward.model.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/infrastructure/data_sources/remote/reward.datasource.dart';

final rewardRepositoryProvider = Provider<RewardRepository>(
  (ref) => RewardRepositoryImpl(
    rewardDataSource: ref.watch(rewardDataSourceProvider),
  ),
);

abstract class RewardRepository {
  Future<Result<List<RewardModel>>> getRewardList();
  Future<Result<List<HistoryModel>>> getHistoryList({required String uid});
  Future<Result<void>> buyItem(
      {required String uid, required String itemName, required int cost});
}

class RewardRepositoryImpl implements RewardRepository {
  final RewardDataSource rewardDataSource;

  RewardRepositoryImpl({required this.rewardDataSource});
  @override
  Future<Result<List<RewardModel>>> getRewardList() async {
    return Result.guardFuture(() => rewardDataSource.getRewardList());
  }

  @override
  Future<Result<void>> buyItem(
      {required String uid,
      required String itemName,
      required int cost}) async {
    return Result.guardFuture(() =>
        rewardDataSource.buyItem(uid: uid, itemName: itemName, cost: cost));
  }

  @override
  Future<Result<List<HistoryModel>>> getHistoryList({required String uid}) {
    return Result.guardFuture(() => rewardDataSource.getHistoryList( uid:uid));
  }
}

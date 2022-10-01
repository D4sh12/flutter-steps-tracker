import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/history.model.dart';
import 'package:steps_tracker_flutter/application/models/reward.model.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';

final rewardDataSourceProvider = Provider<RewardDataSource>(
  (ref) => RewardDataSourceImpl(
    database: ref.watch(fireStoreProvider),
  ),
);

const String rewardCollection = 'reward';
const String historyCollection = 'history';

abstract class RewardDataSource {
  Future<List<RewardModel>> getRewardList();
  Future<List<HistoryModel>> getHistoryList({required String uid});
  Future<void> buyItem(
      {required String uid, required String itemName, required int cost});
}

class RewardDataSourceImpl implements RewardDataSource {
  final FirebaseFirestore database;

  RewardDataSourceImpl({required this.database});

  @override
  Future<List<RewardModel>> getRewardList() async {
    final data = await database.collection(rewardCollection).get();
    return data.docs.map((e) => RewardModel.fromJson(e.data())).toList();
  }

  @override
  Future<void> buyItem(
      {required String uid,
      required String itemName,
      required int cost}) async {
    final data = HistoryModel(
      uid: uid,
      itemName: itemName,
      healthPoint: cost,
      createdAt: DateTime.now().toIso8601String(),
    );

    await database.collection(historyCollection).doc().set(data.toJson());
  }

  @override
  Future<List<HistoryModel>> getHistoryList({required String uid}) async {
    final data = await database
        .collection(historyCollection)
        .where("uid", isEqualTo: uid)
        .get();
    return data.docs.map((e) => HistoryModel.fromJson(e.data())).toList();
  }
}

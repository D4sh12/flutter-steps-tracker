import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/user.model.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';

final userDataSourceProvider = Provider<UserDataSource>(
  (ref) => UserDataSourceImpl(
    database: ref.watch(fireStoreProvider),
  ),
);

abstract class UserDataSource {
  //
  Future<void> createUserProfile(
      {required String uid, required String fullName});
  //
  Stream<UserModel> getUserProfile({required String uid});
  //
  Future<void> updateHealthPoints(
      {required String uid, required int healthPoints});
  //
  Future<void> updateTotalSteps({required String uid, required int steps});
  //
  Stream<List<UserModel>> getLeaderBoard();
}

const String userCollection = 'user';

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore database;

  UserDataSourceImpl({required this.database});

  @override
  Future<void> createUserProfile({
    required String uid,
    required String fullName,
  }) async {
    await database.collection(userCollection).doc(uid).set(
          UserModel(
                  uid: uid, fullName: fullName, healthPoints: 0, totalSteps: 0)
              .toJson(),
        );
  }

  @override
  Stream<UserModel> getUserProfile({required String uid}) {
    return database.collection(userCollection).doc(uid).snapshots().map(
          (event) => UserModel.fromJson(event.data()!),
        );
  }

  @override
  Future<void> updateHealthPoints(
      {required String uid, required int healthPoints}) async {
    final data = {"healthPoints": healthPoints};
    await database.collection(userCollection).doc(uid).update(data);
  }

  @override
  Future<void> updateTotalSteps(
      {required String uid, required int steps}) async {
    final userData = await database.collection(userCollection).doc(uid).get();
    final userModel = UserModel.fromJson(userData.data()!);
    await database
        .collection(userCollection)
        .doc(uid)
        .update({"totalSteps": steps + userModel.totalSteps!});
  }

  @override
  Stream<List<UserModel>> getLeaderBoard() {
    return database
        .collection(userCollection)
        .orderBy("totalSteps")
        .snapshots()
        .map((event) {
      final data = event.docs.map((e) => UserModel.fromJson(e.data())).toList();
      data.sort(((a, b) => b.totalSteps!.compareTo(a.totalSteps!)));
      return data;
    });
  }
}

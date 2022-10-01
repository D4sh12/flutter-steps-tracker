import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/user.model.dart';

import '/core/common_imports.dart';
import '/infrastructure/data_sources/remote/user.datasource.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) =>
    UserRepositoryImpl(userDataSource: ref.watch(userDataSourceProvider)));

abstract class UserRepository {
  Stream<UserModel> getUserProfile({required String uid});
    Stream<List<UserModel>> getLeaderBoard();
  Future<Result<void>> createUserProfile(
      {required String uid, required String fullName});
}

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<Result<void>> createUserProfile(
      {required String uid, required String fullName}) {
    return Result.guardFuture(
        () => userDataSource.createUserProfile(uid: uid, fullName: fullName));
  }

  @override
  Stream<UserModel> getUserProfile({required String uid}) {
    return userDataSource.getUserProfile(uid: uid);
  }

    @override
  Stream<List<UserModel>> getLeaderBoard() {
    return userDataSource.getLeaderBoard();
  }
}

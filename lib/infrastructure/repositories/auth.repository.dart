import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/common_imports.dart';
import '/infrastructure/data_sources/remote/authentication.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) =>
    AuthRepositoryImpl(authentication: ref.watch(authenticationProvider)));

abstract class AuthRepository {
  Future<Result<UserCredential>> signInAnonymous({required String fullName});
  Future<Result<dynamic>> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final Authentication authentication;

  AuthRepositoryImpl({required this.authentication});

  @override
  Future<Result<UserCredential>> signInAnonymous({required String fullName}) {
    return Result.guardFuture(
        () => authentication.signInAnonymous(fullName: fullName));
  }

  @override
  Future<Result> signOut() {
    return Result.guardFuture(() => authentication.signOut());
  }
}

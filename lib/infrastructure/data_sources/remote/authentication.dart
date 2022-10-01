import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';

final authenticationProvider = Provider<Authentication>(
  (ref) => AuthApiImpl(
    auth: ref.watch(firebaseAuthProvider),
  ),
);

// ? AuthApi Interface
abstract class Authentication {
  Future<UserCredential> signInAnonymous({required String fullName});
  Future<dynamic> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<dynamic> signOut();
}

// ? AuthApi Implementation
class AuthApiImpl implements Authentication {
  final FirebaseAuth auth;
  AuthApiImpl({required this.auth});

  @override
  Future<UserCredential> signInAnonymous({required fullName}) {
    return auth.signInAnonymously();
  }

  @override
  Future signInWithEmailAndPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future signOut() async {
    await auth.signOut();
  }
}

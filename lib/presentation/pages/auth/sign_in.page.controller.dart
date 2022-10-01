import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/auth.repository.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/user.repository.dart';
import 'package:steps_tracker_flutter/presentation/widgets/toast.dart';

final signInPageControllerProvider =
    StateNotifierProvider.autoDispose<SignInPageController, AsyncValue<void>>(
  (ref) => SignInPageController(
    authRepository: ref.watch(authRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
    cache: ref.watch(localStorageServiceProvider),
  ),
);

class SignInPageController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final LocalStorageService cache;

  SignInPageController(
      {required this.authRepository,
      required this.userRepository,
      required this.cache})
      : super(const AsyncData(null));

  void signIn({required String fullName, required Function() next}) async {
    state = const AsyncLoading();
    final result = await authRepository.signInAnonymous(fullName: fullName);
    result.when(success: (data) async {
      userRepository
          .createUserProfile(uid: data.user!.uid, fullName: fullName)
          .then(
        (value) {
          value.when(
              success: (_) {
                cache.saveIsLoggedIn(isLoggedIn: true);
                state = const AsyncData(null);
                next();
              },
              failure: (error) => showToast(msg: error));
        },
      );
    }, failure: (error) {
      state = const AsyncData(null);
      showToast(msg: error);
    });
  }
}

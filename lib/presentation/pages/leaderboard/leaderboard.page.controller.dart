import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/user.model.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/user.repository.dart';

final leaderBoardPageControllerProvider = StateNotifierProvider<
    LeaderBoardPageController, AsyncValue<List<UserModel>>>(
  (ref) => LeaderBoardPageController(
      userRepository: ref.watch(userRepositoryProvider))
    ..init(),
);

class LeaderBoardPageController
    extends StateNotifier<AsyncValue<List<UserModel>>> {
  final UserRepository userRepository;
  LeaderBoardPageController({required this.userRepository})
      : super(const AsyncLoading());

  void init() {
    userRepository.getLeaderBoard().listen((event) {
      state = AsyncData(event);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/presentation/pages/home/home.page.dart';
import 'package:steps_tracker_flutter/presentation/pages/leaderboard/leaderboard.page.dart';
import 'package:steps_tracker_flutter/presentation/pages/profile/profile.page.dart';
import 'package:steps_tracker_flutter/presentation/pages/reward/reward.page.dart';
import 'package:steps_tracker_flutter/presentation/widgets/bottom_navigation_bar.dart';

class AppLayout extends ConsumerWidget {
  const AppLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigatorBar(),
      body: _buildScaffoldBody(ref),
    );
  }

  Widget _buildScaffoldBody(WidgetRef ref) {
    switch (ref.watch(bottomNavigatonIndexProvider)) {
      case 0:
        return const HomePage();
      case 1:
        return const LeaderBoardPage();
      case 2:
        return const RewardPage();
      case 3:
        return const ProfilePage();
    }
    return const SizedBox();
  }
}

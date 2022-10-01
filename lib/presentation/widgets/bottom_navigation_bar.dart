import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final bottomNavigatonIndexProvider = StateProvider<int>((ref) => 0);

class CustomBottomNavigatorBar extends ConsumerWidget {
  const CustomBottomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context)!;
    return BottomNavigationBar(
      onTap: ((currentIndex) {
        ref.read(bottomNavigatonIndexProvider.notifier).state = currentIndex;
      }),
      currentIndex: ref.watch(bottomNavigatonIndexProvider),
      items: [
        BottomNavigationBarItem(
          label: tr.homePageTitle,
          activeIcon: const Icon(Icons.health_and_safety),
          icon: const Icon(Icons.health_and_safety_outlined),
        ),
        BottomNavigationBarItem(
          label: tr.learderBoardPageTitle,
          activeIcon: const Icon(Icons.leaderboard_rounded),
          icon: const Icon(Icons.leaderboard_outlined),
        ),
        BottomNavigationBarItem(
          label: tr.rewardsPageTitle,
          activeIcon: const Icon(Icons.wallet_giftcard),
          icon: const Icon(Icons.wallet_giftcard_outlined),
        ),
        BottomNavigationBarItem(
          label: tr.profilePageTitle,
          activeIcon: const Icon(Icons.person),
          icon: const Icon(Icons.person_outline),
        ),
      ],
    );
  }
}

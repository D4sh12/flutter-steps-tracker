import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/presentation/pages/reward/reward.page.controller.dart';
import 'package:steps_tracker_flutter/presentation/pages/reward/widgets/reward_item_card.dart';

class RewardPage extends ConsumerWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(rewardPageControllerProvider);

    return controller.when(
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (rewardList) => Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenPaddingX,
              vertical: SizeConfig.screenPaddingX),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemCount: rewardList.length,
            itemBuilder: (context, index) {
              return ProviderScope(
                overrides: [
                  rewardItemCardProvider.overrideWithValue(rewardList[index])
                ],
                child: RewardItemCard(),
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(tr.rewardsPageTitle),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/application/models/reward.model.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/reward.repository.dart';
import 'package:steps_tracker_flutter/infrastructure/repositories/user.repository.dart';
import 'package:steps_tracker_flutter/presentation/pages/reward/reward.page.controller.dart';
import 'package:steps_tracker_flutter/presentation/widgets/toast.dart';

final rewardItemCardProvider = Provider<RewardModel>(
  (ref) {
    throw UnimplementedError();
  },
);

class RewardItemCard extends ConsumerWidget {
  RewardItemCard({Key? key}) : super(key: key);
  late int healthPoint;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rewardItemCardProvider);
    final uid = ref.watch(firebaseAuthProvider).currentUser!.uid;
    ref.watch(userRepositoryProvider).getUserProfile(uid: uid).listen((event) {
      healthPoint = event.healthPoints;
    });

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
      ),
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.27,
        width: SizeConfig.screenWidth * 0.43,
        child: ListTile(
          onTap: () {
            ref.read(rewardPageControllerProvider.notifier).buyItem(
                healthPoint: healthPoint,
                uid: uid,
                title: state.title,
                cost: state.cost);
          },
          contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.screenPaddingY * 0.2,
              horizontal: SizeConfig.screenPaddingX),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Text(state.title,
                    maxLines: 2, style: Theme.of(context).textTheme.subtitle2),
              ),
              Text(
                '${state.cost} HP',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          subtitle: Center(
            child: SizedBox(
              height: SizeConfig.screenWidth * 0.4,
              width: SizeConfig.screenWidth * 0.4,
              child: Icon(
                Icons.coffee_outlined,
                size: SizeConfig.screenWidth * 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

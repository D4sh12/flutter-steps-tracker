import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/presentation/pages/home/home.page.controller.dart';
import 'package:steps_tracker_flutter/presentation/pages/home/widgets/activity_card.dart';
import 'package:steps_tracker_flutter/presentation/pages/home/widgets/activity_status_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homePageControllerProvider);
    final tr = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _buildAppBar(context, controller.userModel.healthPoints),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenPaddingX),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProviderScope(
                overrides: [
                  activityStatusCardProvider
                      .overrideWithValue(controller.exerciseModel)
                ],
                child: const ActivityStatusCard(),
              ),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                children: [
                  ActivityCard(title: tr.running, icon: Icons.directions_walk_outlined),
                  ActivityCard(title: tr.calories, icon: Icons.local_fire_department_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, int healthPoints) {
    final tr = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(tr.homePageTitle),
      backgroundColor: Colors.transparent,
      actions: [
        TextButton.icon(
          label: Text(
            '$healthPoints',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          onPressed: null,
          icon: Icon(Icons.heart_broken_rounded,
              color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}

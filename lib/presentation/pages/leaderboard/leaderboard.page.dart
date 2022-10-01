import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:steps_tracker_flutter/application/models/user.model.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/presentation/pages/leaderboard/leaderboard.page.controller.dart';

class LeaderBoardPage extends ConsumerWidget {
  const LeaderBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(leaderBoardPageControllerProvider);

    return Scaffold(
        appBar: _buildAppBar(context),
        body: controller.when(
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (userList) => _buildScaffoldBody(context, userList),
        ));
  }

  Widget _buildScaffoldBody(BuildContext context, List<UserModel> userList) {
    final tr = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenPaddingX,
          vertical: SizeConfig.screenPaddingX),
      child: Column(
        children: userList
            .map(
              (e) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(SizeConfig.screenPaddingX),
                  leading: Text(
                    '${e.healthPoints}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  title: Text(
                    e.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: SizeConfig.screenWidth * 0.05),
                  ),
                  trailing: Text(
                    '${e.totalSteps} ${tr.step}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(tr.learderBoardPageTitle),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: const Icon(
        Icons.view_list_rounded,
      ),
    );
  }
}

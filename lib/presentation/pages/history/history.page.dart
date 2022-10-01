import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/presentation/pages/history/history.dart.controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context)!;

    final controller = ref.watch(historyPageControllerProvider);

    return controller.when(
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (historyList) => Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenPaddingX,
              vertical: SizeConfig.screenPaddingX),
          child: Column(
            children: historyList
                .map(
                  (e) => ListTile(
                    leading: Text(
                      "-${e.healthPoint}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    title: const Text('Health Points'),
                    subtitle: Text(
                        "Spent at ${e.itemName} on\n ${e.createdAt.replaceFirst('T', ' ')}"),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(tr.history),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}

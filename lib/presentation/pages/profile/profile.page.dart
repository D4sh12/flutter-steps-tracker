import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:steps_tracker_flutter/presentation/config/app_theme.dart';
import 'package:steps_tracker_flutter/presentation/config/routes.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _buildAppBar(context, tr),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenPaddingX,
            vertical: SizeConfig.screenPaddingX),
        child: Column(
          children: [
            _buildThemeSwitch(context, ref, tr),
            _buildLocaleSwitch(context, ref, tr),
            ListTile(
              leading: const Icon(Icons.history_outlined),
              title: Text(tr.history),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => Navigator.of(context).pushNamed(Routes.historyPage),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AppLocalizations tr) {
    final tr = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(tr.profilePageTitle),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildThemeSwitch(
      BuildContext context, WidgetRef ref, AppLocalizations tr) {
    final state = ref.watch(localStorageServiceProvider).isDarkMode;
    return ListTile(
      leading: Icon(state ? Icons.dark_mode_outlined : Icons.light_mode),
      title: Text(tr.theme),
      trailing: Switch(
        value: state,
        onChanged: (value) {
          AppTheme.of(context).changeAppTheme();
          ref.watch(localStorageServiceProvider).changeThemeMode(isDark: value);
        },
      ),
    );
  }

  Widget _buildLocaleSwitch(
      BuildContext context, WidgetRef ref, AppLocalizations tr) {
    final state = ref.watch(localStorageServiceProvider).currentLangauge;
    return ListTile(
      leading: const Icon(Icons.language_outlined),
      title: Text(tr.language),
      trailing: Switch(
        value: state == 'en' ? true : false,
        onChanged: (value) {
          AppTheme.of(context)
              .changeLocale(newLocale: Locale(value ? 'en' : 'ar'));
          ref
              .watch(localStorageServiceProvider)
              .changeCurrentLanguage(language: value ? 'en' : 'ar');
        },
      ),
    );
  }
}

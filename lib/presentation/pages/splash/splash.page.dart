import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '/core/common_imports.dart';
import '/presentation/pages/auth/sign_in.page.dart';
import '/presentation/layouts/main_layout_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context)!;

    final localStorage = ref.watch(localStorageServiceProvider);
    final firebaseState = ref.watch(firebaseinitializerProvider);

    SizeConfig(context);
    return AnimatedSplashScreen(
      splash: Text(tr.appTitle,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor)),
      duration: 10,
      centered: true,
      nextScreen: firebaseState.when(
        data: (data) {
          debugPrint("[FIREBASE INITIALIZER] Attemting to connect to firebase");
          return localStorage.isLoggedIn ? const AppLayout() : SignInPage();
        },
        error: (error, st) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}

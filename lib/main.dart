import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_theme/json_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/core/services/notification.service.dart';
import 'package:steps_tracker_flutter/core/services/pedometer.service.dart';
import 'package:steps_tracker_flutter/presentation/config/routes.dart';
import 'package:steps_tracker_flutter/presentation/config/app_theme.dart';
import 'package:steps_tracker_flutter/presentation/pages/splash/splash.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  final darkTheme = ThemeDecoder.decodeThemeData(
      json.decode(await rootBundle.loadString(AppThemes.darkTheme)))!;
  final lightTheme = ThemeDecoder.decodeThemeData(
      json.decode(await rootBundle.loadString(AppThemes.lightTheme)))!;

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: AppThemeWidget(
          darkTheme: darkTheme, lightTheme: lightTheme, child: const MyApp()),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("[APP STATE] resumed");
        ref.watch(pedometerServiceProvider).init();
        break;

      case AppLifecycleState.inactive:
        debugPrint("[APP STATE] inactive");
        break;

      case AppLifecycleState.paused:
        debugPrint("[APP STATE] paused");
        break;
      case AppLifecycleState.detached:
        debugPrint("[APP STATE] detached");
        break;
    }
  }

  Future<void> initApp() async {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  initState() {
    super.initState();
    initApp().then((_) => debugPrint("App Init Completed"));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //? Initial Notification services
    ref.watch(localNotificationServiceProvier).setup();
    
    AppTheme.of(context).isDarkModeEnabled =
        ref.watch(localStorageServiceProvider).isDarkMode;
    AppTheme.of(context).locale =
        Locale(ref.watch(localStorageServiceProvider).currentLangauge);

    return MaterialApp(
      title: 'Steps Tracker',
      initialRoute: Routes.root,
      routes: Routes.configureRoutes(),
      debugShowCheckedModeBanner: false,
      locale: AppTheme.of(context).locale,
      theme: AppTheme.of(context).lightTheme,
      themeMode: AppTheme.of(context).themeMode,
      darkTheme: AppTheme.of(context).darkTheme,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const SplashPage(),
    );
  }
}

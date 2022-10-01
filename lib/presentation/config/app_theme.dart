import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

import '/core/common_imports.dart' show AppThemes;

/// Global InheritedWidget to access the data of the plugin
/// Current Theme related data or methods
class AppTheme extends InheritedWidget {
  final AppThemeWidgetState data;

  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static AppThemeWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!.data;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return this != oldWidget;
  }
}

/// Widget that will contains the whole app
class AppThemeWidget extends StatefulWidget {
  final Widget child;
  final ThemeData darkTheme, lightTheme;

  const AppThemeWidget(
      {super.key,
      required this.child,
      required this.darkTheme,
      required this.lightTheme});

  @override
  AppThemeWidgetState createState() => AppThemeWidgetState();
}

class AppThemeWidgetState extends State<AppThemeWidget> {
// #region Theme
  ThemeMode? themeMode;
  ThemeData? darkTheme, lightTheme;
  late bool isDarkModeEnabled;
  void changeAppTheme() {
    ThemeMode? newThemeMode;
    if (isDarkModeEnabled) {
      newThemeMode = ThemeMode.light;
    } else {
      newThemeMode = ThemeMode.dark;
    }

    setState(() {
      themeMode = newThemeMode;
      isDarkModeEnabled = !isDarkModeEnabled;
    });
  }
// #endregion

// #region Localizations
  late Locale _locale = const Locale('en');
  // ignore: unnecessary_getters_setters
  Locale get locale => _locale;
  set locale(Locale locale) {
    _locale = locale;
  }

  void changeLocale({required Locale newLocale}) {
    setState(() {
      _locale = newLocale;
      debugPrint(_locale.languageCode);
    });
  }
// #endregion

  @override
  void initState() {
    lightTheme = widget.lightTheme;
    darkTheme = widget.darkTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // FutureBuilder<void>(
        // future: loadThemeData(),
        // builder: (context, snapshot) =>
        AppTheme(data: this, child: widget.child);
    // );
  }
}

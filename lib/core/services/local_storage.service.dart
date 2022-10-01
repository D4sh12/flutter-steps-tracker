import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferencesKeys {
  isDarkMode,
  isLoggedIn,
  authToken,
  currentLanguage,
}

extension ParseToString on PreferencesKeys {
  String toShortString() => toString().split('.').last.toLowerCase();
}

/// Global Providers
///
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final localStorageServiceProvider = Provider<LocalStorageService>(
  ((ref) {
    final prefs = ref.watch(sharedPreferencesProvider);
    return LocalStorageService(sharedPreference: prefs);
  }),
);

/// Provid common method used to store simple date
/// by implementing SharedPreferences Package.
///
/// Storing and change App Theme Mode
/// ```dart
/// //Get app theme mode
/// localStorageService.isDarkMode  // true,false
/// //Change app theme mode
/// localStorageService.changeThemeMode(isDark: true)
/// ```
class LocalStorageService {
  final SharedPreferences sharedPreference;

  LocalStorageService({required this.sharedPreference});

// #region Genral Methods [Authentication]
  String get authToken =>
      sharedPreference.getString(PreferencesKeys.authToken.toShortString()) ??
      '';

  Future<void> saveAuthToken({required String authToken}) async =>
      sharedPreference.setString(
          PreferencesKeys.authToken.toShortString(), authToken);
// #endregion

// #region Genral Methods [LogIn]
  bool get isLoggedIn =>
      sharedPreference.getBool(PreferencesKeys.isLoggedIn.toShortString()) ??
      false;

  Future<void> saveIsLoggedIn({required bool isLoggedIn}) async =>
      sharedPreference.setBool(
          PreferencesKeys.isLoggedIn.toShortString(), isLoggedIn);
// #endregion

// #region Genral Methods [Theme]

  bool get isDarkMode =>
      sharedPreference.getBool(PreferencesKeys.isDarkMode.toShortString()) ??
      false;

  Future<void> changeThemeMode({required bool isDark}) async => sharedPreference
      .setBool(PreferencesKeys.isDarkMode.toShortString(), isDark);
// #endregion

// #region Genral Methods [Language]
  String get currentLangauge =>
      sharedPreference
          .getString(PreferencesKeys.currentLanguage.toShortString()) ??
      'en';

  Future<void> changeCurrentLanguage({required String language}) async =>
      sharedPreference.setString(
          PreferencesKeys.currentLanguage.toShortString(), language);
// #endregion
}

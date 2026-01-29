import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static late SharedPreferences _prefs;

  static const _themeKey = 'theme_mode';
  static const _localeKey = 'locale';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static ThemeMode getThemeMode() {
    final value = _prefs.get(_themeKey);

    if (value is String) {
      switch (value) {
        case 'dark':
          return ThemeMode.dark;
        case 'light':
          return ThemeMode.light;
      }
    }

    return ThemeMode.system;
  }

  static Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setString(
      _themeKey,
      mode == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  static Locale? getLocale() {
    final value = _prefs.get(_localeKey);
    if (value is String) {
      return Locale(value);
    }
    return null;
  }

  static Future<void> setLocale(Locale locale) async {
    await _prefs.setString(
      _localeKey,
      locale.languageCode,
    );
  }
}

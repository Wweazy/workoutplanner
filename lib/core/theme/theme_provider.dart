import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/preferences_service.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(PreferencesService.getThemeMode());

  void toggleTheme() {
    final newMode =
    state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    state = newMode;
    PreferencesService.setThemeMode(newMode);
  }
}

final themeModeProvider =
StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
      (ref) => ThemeModeNotifier(),
);

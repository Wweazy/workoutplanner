import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/preferences_service.dart';

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(PreferencesService.getLocale());

  void setLocale(Locale locale) {
    state = locale;
    PreferencesService.setLocale(locale);
  }
}

final localeProvider =
StateNotifierProvider<LocaleNotifier, Locale?>(
      (ref) => LocaleNotifier(),
);

# androidapp

To jest aplikacja mobilna napisana we Flutterze — prosty menedżer treningów.

## Krótkie podsumowanie programu

- Aplikacja pozwala tworzyć listę treningów, dodawać do nich ćwiczenia (serie, powtórzenia, ciężar) oraz oznaczać treningi jako zakończone.
- Dodane lokalizacje: angielski, polski i rosyjski; wybór języka jest trwały (zapisany w ustawieniach).
- Zaimplementowano wygodny wybór języka z flagami i natywną nazwą języka.
- Poprawiono wygląd interfejsu: przyciski, karty i pola formularzy.

## Wymagania

- Zainstalowany Flutter (wersja stabilna) i narzędzia platformy (Android SDK) do budowania aplikacji mobilnej.
- Połączenie z internetem do pobrania zależności.

## Zmiany i pliki do sprawdzenia

- Lokalizacja i łańcuch zapisu preferencji:
	- [lib/core/localization/app_strings.dart](lib/core/localization/app_strings.dart) — centralne teksty (EN/PL/RU).
	- [lib/core/localization/locale_provider.dart](lib/core/localization/locale_provider.dart) — provider Riverpod zarządzający `Locale`.
	- [lib/core/storage/preferences_service.dart](lib/core/storage/preferences_service.dart) — zapis ustawień (SharedPreferences).

- UI wyboru języka:
	- [lib/features/workout/presentation/workout_list_page.dart](lib/features/workout/presentation/workout_list_page.dart) — AppBar pokazuje aktualny język jako flagę; wybór otwiera modal z kartami zawierającymi flagę, lokalizowaną nazwę i natywną nazwę (mały szary font).

- Poprawki układu formularza dodawania ćwiczenia:
	- [lib/features/workout/presentation/add_exercise_page.dart](lib/features/workout/presentation/add_exercise_page.dart) — pola są w `ListView`, etykiety znajdują się nad polami, dodany `suffixText` dla jednostki (kg).

## Krótkie podsumowanie programu

- Aplikacja pozwala tworzyć listę treningów, dodawać do nich ćwiczenia (serie, powtórzenia, ciężar) oraz oznaczać treningi jako zakończone.
- Dodane lokalizacje: angielski, polski i rosyjski; wybór języka jest trwały (zapisany w ustawieniach).
- Zaimplementowano wygodny wybór języka z flagami i natywną nazwą języka.
- Poprawiono wygląd interfejsu: przyciski, karty i pola formularzy.

## Zmiany i pliki do sprawdzenia

- Lokalizacja i łańcuch zapisu preferencji:
	- [lib/core/localization/app_strings.dart](lib/core/localization/app_strings.dart) — centralne teksty (EN/PL/RU).
	- [lib/core/localization/locale_provider.dart](lib/core/localization/locale_provider.dart) — provider Riverpod zarządzający `Locale`.
	- [lib/core/storage/preferences_service.dart](lib/core/storage/preferences_service.dart) — zapis ustawień (SharedPreferences).

- UI wyboru języka:
	- [lib/features/workout/presentation/workout_list_page.dart](lib/features/workout/presentation/workout_list_page.dart) — AppBar pokazuje aktualny język jako flagę; wybór otwiera modal z kartami zawierającymi flagę, lokalizowaną nazwę i natywną nazwę (mały szary font).

- Poprawki układu formularza dodawania ćwiczenia:
	- [lib/features/workout/presentation/add_exercise_page.dart](lib/features/workout/presentation/add_exercise_page.dart) — pola są w `ListView`, etykiety znajdują się nad polami, dodany `suffixText` dla jednostki (kg).

- Motyw aplikacji i style:
	- [lib/core/theme/app_theme.dart](lib/core/theme/app_theme.dart) — ulepszone `ElevatedButtonTheme`, `CardThemeData`, `AppBarTheme`, `InputDecorationTheme`, typografia (Google Fonts).

- Router i nawigacja:
	- [lib/core/router/app_router.dart](lib/core/router/app_router.dart) — konfiguracja tras (go_router).

## Użyte biblioteki (wybrane)

- `flutter_riverpod` — stan aplikacji i provider `locale`.
- `go_router` — nawigacja.
- `shared_preferences` — trwałe przechowywanie ustawień (język, motyw).
- `flex_color_scheme`, `google_fonts` — motyw i typografia.
- `objectbox` — lokalna baza danych (model i pliki wygenerowane w repozytorium).
- `flutter_localizations` i `intl` (w zależności) — wsparcie dla lokalizacji i formatowania dat.


## Jak uruchomić lokalnie

1. Pobierz zależności:

```bash
flutter pub get
```

2. Uruchom aplikację na emulatorze lub urządzeniu:

```bash
flutter run
```

## Zagadnienia

Poniżej znajduje się lista wymagań (zagadnień) z krótkim opisem, czy i jak zostały zaimplementowane w projekcie.

- **Nawigacja - GoRouter (push, pop, replace, named routes):**
	- Zaimplementowano w [lib/core/router/app_router.dart](lib/core/router/app_router.dart#L1-L200). Używane są nazwy tras (`pushNamed`) i przejścia między stronami.

- **Obsługa stanu (future / async, switch) - Riverpod:**
	- Użyto `flutter_riverpod` do zarządzania stanem aplikacji; przykłady: `localeProvider` ([lib/core/localization/locale_provider.dart](lib/core/localization/locale_provider.dart#L1-L200)), `themeModeProvider`, `workoutProvider` i providery ćwiczeń.

- **Komunikacja z zewn. API - DIO, JSON freeze:**
	- `dio` jest w zależnościach i używany w serwisie API (np. w [lib/features/exercises/data/exercises_api_service.dart](lib/features/exercises/data/exercises_api_service.dart#L1-L200)). Modele danych wspierane są przez generatory JSON (`freezed`/`json_serializable`) jeśli występują w kodzie.

- **SharedPreferences:**
	- Zaimplementowano w [lib/core/storage/preferences_service.dart](lib/core/storage/preferences_service.dart#L1-L200) — używane do trwałego zapisu ustawień, m.in. wyboru języka i trybu motywu.

- **Baza danych obiektowa na urządzeniu - ObjectBox (lub alternatywy jak Isar):**
	- W projekcie użyto `objectbox` (pliki wygenerowane istnieją w repozytorium). Lokalna baza danych i encje znajdują się w katalogu `lib` (np. modele i `objectbox.g.dart`).

- **Wybór języka - i18n/internationalization, l10n - localization:**
	- W projekcie zastosowano ręczny system lokalizacji (`lib/core/localization/app_strings.dart`) z obsługą EN/PL/RU oraz integrację Flutter Localizations ([lib/main.dart](lib/main.dart#L1-L200)). Zaimplementowano wybór języka i zapis preferencji (`localeProvider`, `PreferencesService`).

- **Obsługa dark/light mode - FlexColorScheme:**
	- Motyw i tryb jasny/ciemny oparte na `flex_color_scheme` i `GoogleFonts` zaimplementowano w [lib/core/theme/app_theme.dart](lib/core/theme/app_theme.dart#L1-L200) oraz przez provider trybu motywu.

- **Obsługa przycisków tekstowych / z grafiką, obsługa formularza z danymi (pola tekstowe, wybór daty, wybór pliku):**
	- Formularze (np. dodawanie treningu i ćwiczeń) używają `TextField`, `ElevatedButton`, `showDatePicker`. Przykłady: [lib/features/workout/presentation/add_exercise_page.dart](lib/features/workout/presentation/add_exercise_page.dart#L1-L200) i [lib/features/workout/presentation/add_workout_page.dart](lib/features/workout/presentation/add_workout_page.dart#L1-L200).
	- Obsługa wyboru pliku (upload) nie jest domyślnie zaimplementowana — można dodać (np. `file_picker`).

- **Użyć GoogleFonts:**
	- `google_fonts` jest użyty w motywie aplikacji ([lib/core/theme/app_theme.dart](lib/core/theme/app_theme.dart#L1-L200)).

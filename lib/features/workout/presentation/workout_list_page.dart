import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/workout_providers.dart';
import '../data/workout_entity.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/localization/app_strings.dart';

DateTime onlyDate(DateTime d) => DateTime(d.year, d.month, d.day);

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

class WorkoutListPage extends ConsumerWidget {
  const WorkoutListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(workoutProvider);
    final locale = Localizations.localeOf(context);

    final todayDate = onlyDate(DateTime.now());

    final today = workouts
        .where((w) => isSameDay(onlyDate(w.date), todayDate))
        .toList();

    final upcoming = workouts
        .where((w) => onlyDate(w.date).isAfter(todayDate))
        .toList();

    final past = workouts
        .where((w) => onlyDate(w.date).isBefore(todayDate))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.workouts(locale)),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleTheme();
            },
          ),
          Builder(builder: (context) {
            final current = ref.watch(localeProvider) ?? Localizations.localeOf(context);
            final flagMap = {
              'en': '🇬🇧',
              'pl': '🇵🇱',
              'ru': '🇷🇺',
            };

            String currentFlag() => flagMap[(current.languageCode)] ?? '🏳️';

            return IconButton(
              tooltip: AppStrings.selectLanguage(Localizations.localeOf(context)),
              onPressed: () {
                final languages = [Locale('en'), Locale('pl'), Locale('ru')];
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  builder: (ctx) {
                    final selected = ref.read(localeProvider) ?? Localizations.localeOf(context);
                    final nativeNames = {'en': 'English', 'pl': 'Polski', 'ru': 'Русский'};

                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            child: Text(
                              AppStrings.selectLanguage(selected),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...languages.map((l) {
                            final localizedLabel = l.languageCode == 'en'
                                ? AppStrings.languageEnglish(selected)
                                : l.languageCode == 'pl'
                                    ? AppStrings.languagePolish(selected)
                                    : AppStrings.languageRussian(selected);

                            return Card(
                              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              child: ListTile(
                                leading: Text(flagMap[l.languageCode] ?? '🏳️', style: const TextStyle(fontSize: 24)),
                                title: Text(localizedLabel),
                                subtitle: Text(
                                  nativeNames[l.languageCode] ?? l.languageCode,
                                  style: TextStyle(fontSize: 12, color: Theme.of(context).disabledColor),
                                ),
                                trailing: (selected.languageCode == l.languageCode)
                                    ? const Icon(Icons.check, color: Colors.green)
                                    : null,
                                onTap: () {
                                  ref.read(localeProvider.notifier).setLocale(l);
                                  Navigator.of(ctx).pop();
                                },
                              ),
                            );
                          }).toList(),
                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.transparent,
                child: Text(currentFlag(), style: const TextStyle(fontSize: 18)),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('addWorkout'),
        child: const Icon(Icons.add),
      ),
      body: workouts.isEmpty
          ? Center(
        child: Text(AppStrings.noWorkouts(locale)),
      )
          : ListView(
        children: [
          if (today.isNotEmpty) ...[
            _SectionTitle(AppStrings.today(locale)),
            ...today.map((w) => _WorkoutTile(w)),
          ],
          if (upcoming.isNotEmpty) ...[
            _SectionTitle(AppStrings.upcoming(locale)),
            ...upcoming.map((w) => _WorkoutTile(w)),
          ],
          if (past.isNotEmpty) ...[
            _SectionTitle(AppStrings.past(locale)),
            ...past.map((w) => _WorkoutTile(w)),
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _WorkoutTile extends ConsumerWidget {
  final WorkoutEntity workout;
  const _WorkoutTile(this.workout);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(workout.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        ref.read(workoutProvider.notifier).deleteWorkout(workout);
      },
      child: ListTile(
        title: Text(workout.name),
        subtitle: Text(
          onlyDate(workout.date).toString().split(' ')[0],
        ),
        trailing: Switch(
          value: workout.completed,
          onChanged: (_) {
            ref
                .read(workoutProvider.notifier)
                .toggleCompleted(workout);
          },
        ),
        onTap: () {
          context.pushNamed(
            'workoutDetails',
            pathParameters: {
              'id': workout.id.toString(),
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/localization/app_strings.dart';
import 'package:go_router/go_router.dart';

import '../providers/workout_providers.dart';
import '../providers/exercises_provider.dart';

class WorkoutDetailsPage extends ConsumerWidget {
  final int workoutId;

  const WorkoutDetailsPage({
    super.key,
    required this.workoutId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    final workouts = ref.watch(workoutProvider);
    final workout = workouts.firstWhere((w) => w.id == workoutId);

    final exercises = ref.watch(exercisesProvider(workoutId));

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.workoutDetails(Localizations.localeOf(context))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(
            'addExercise',
            pathParameters: {
              'workoutId': workoutId.toString(),
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workout.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${AppStrings.date(locale)}: ${workout.date.toLocal().toString().split(' ')[0]}',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(AppStrings.completed(locale)),
                const SizedBox(width: 8),
                Switch(
                  value: workout.completed,
                  onChanged: (_) {
                    ref
                        .read(workoutProvider.notifier)
                        .toggleCompleted(workout);
                  },
                ),
              ],
            ),
            const Divider(height: 24),
            Text(
              AppStrings.exercises(locale),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: exercises.isEmpty
                  ? Center(
                child: Text(
                  AppStrings.noExercises(locale),
                  style: const TextStyle(color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final e = exercises[index];
                  return ListTile(
                    title: Text(e.exerciseName),
                    subtitle:
                      Text('${e.sets} x ${e.reps} · ${e.weight} ${AppStrings.kg(locale)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref
                            .read(
                            exercisesProvider(workoutId).notifier)
                            .deleteExercise(e);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

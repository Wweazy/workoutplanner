import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/objectbox_service.dart';
import '../data/workout_entity.dart';

final workoutProvider =
StateNotifierProvider<WorkoutNotifier, List<WorkoutEntity>>(
      (ref) => WorkoutNotifier(),
);

class WorkoutNotifier extends StateNotifier<List<WorkoutEntity>> {
  WorkoutNotifier() : super([]) {
    loadWorkouts();
  }

  void loadWorkouts() {
    final workouts = ObjectBoxService.workoutBox.getAll();
    state = workouts;
  }

  void addWorkout(String name, DateTime date) {
    final workout = WorkoutEntity(
      name: name,
      date: date,
      completed: false,
    );

    ObjectBoxService.workoutBox.put(workout);
    loadWorkouts();
  }

  void toggleCompleted(WorkoutEntity workout) {
    final updated = WorkoutEntity(
      name: workout.name,
      date: workout.date,
      completed: !workout.completed,
    )..id = workout.id;

    ObjectBoxService.workoutBox.put(updated);
    loadWorkouts();
  }

  void deleteWorkout(WorkoutEntity workout) {
    ObjectBoxService.workoutBox.remove(workout.id);
    loadWorkouts();
  }
}

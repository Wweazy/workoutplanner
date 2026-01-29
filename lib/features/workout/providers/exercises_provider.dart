import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/db/objectbox_service.dart';
import '../data/exercise_entry_entity.dart';
import '../../../objectbox.g.dart';


final exercisesProvider = StateNotifierProvider.family<
    ExercisesNotifier,
    List<ExerciseEntryEntity>,
    int>((ref, workoutId) {
  return ExercisesNotifier(workoutId);
});

class ExercisesNotifier extends StateNotifier<List<ExerciseEntryEntity>> {
  final int workoutId;

  ExercisesNotifier(this.workoutId) : super([]) {
    load();
  }

  void load() {
    state = ObjectBoxService.exerciseEntryBox
        .query(ExerciseEntryEntity_.workoutId.equals(workoutId))
        .build()
        .find();
  }

  void addExercise(ExerciseEntryEntity entry) {
    ObjectBoxService.exerciseEntryBox.put(entry);
    load();
  }

  void deleteExercise(ExerciseEntryEntity entry) {
    ObjectBoxService.exerciseEntryBox.remove(entry.id);
    load();
  }
}

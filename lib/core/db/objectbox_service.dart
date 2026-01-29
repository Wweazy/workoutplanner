import 'package:objectbox/objectbox.dart';
import '../../objectbox.g.dart';
import '../../features/workout/data/workout_entity.dart';
import '../../features/workout/data/exercise_entry_entity.dart';

class ObjectBoxService {
  static late final Store store;
  static late final Box<WorkoutEntity> workoutBox;
  static late final Box<ExerciseEntryEntity> exerciseEntryBox;

  static Future<void> init() async {
    store = await openStore();
    workoutBox = store.box<WorkoutEntity>();
    exerciseEntryBox = store.box<ExerciseEntryEntity>();
  }
}

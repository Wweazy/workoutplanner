import 'package:objectbox/objectbox.dart';

@Entity()
class ExerciseEntryEntity {
  @Id()
  int id = 0;

  int workoutId;

  String exerciseName;
  int sets;
  int reps;
  double weight;

  ExerciseEntryEntity({
    required this.workoutId,
    required this.exerciseName,
    required this.sets,
    required this.reps,
    required this.weight,
  });
}

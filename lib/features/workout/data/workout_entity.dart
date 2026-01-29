import 'package:objectbox/objectbox.dart';

import 'exercise_entry_entity.dart';

@Entity()
class WorkoutEntity {
  @Id()
  int id = 0;

  String name;
  DateTime date;
  bool completed;

  final exercises = ToMany<ExerciseEntryEntity>();

  WorkoutEntity({
    required this.name,
    required this.date,
    this.completed = false,
  });
}

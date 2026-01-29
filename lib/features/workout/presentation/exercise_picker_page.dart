import 'package:flutter/material.dart';
import '../../exercises/data/exercise_model.dart';
import '../../exercises/data/exercises_api_service.dart';
import '../../../core/localization/app_strings.dart';

class ExercisePickerPage extends StatefulWidget {
  const ExercisePickerPage({super.key});

  @override
  State<ExercisePickerPage> createState() => _ExercisePickerPageState();
}

class _ExercisePickerPageState extends State<ExercisePickerPage> {
  late Future<List<Exercise>> _future;

  @override
  void initState() {
    super.initState();
    _future = ExercisesApiService().fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.chooseExercise(locale)),
      ),
      body: FutureBuilder<List<Exercise>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(AppStrings.errorLoadingExercises(locale)),
            );
          }

          final exercises = snapshot.data ?? [];

          if (exercises.isEmpty) {
            return Center(
              child: Text(AppStrings.noExercisesFound(locale)),
            );
          }

          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises[index];
              return ListTile(
                title: Text(exercise.name),
                subtitle: exercise.category.isNotEmpty
                    ? Text(exercise.category)
                    : null,
                onTap: () {
                  Navigator.pop(context, exercise);
                },
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/localization/app_strings.dart';
import '../data/exercise_entry_entity.dart';
import '../providers/exercises_provider.dart';
import '../../exercises/data/exercise_model.dart';
import 'exercise_picker_page.dart';

class AddExercisePage extends ConsumerStatefulWidget {
  final int workoutId;

  const AddExercisePage({super.key, required this.workoutId});

  @override
  ConsumerState<AddExercisePage> createState() => _AddExercisePageState();
}

class _AddExercisePageState extends ConsumerState<AddExercisePage> {
  final _sets = TextEditingController();
  final _reps = TextEditingController();
  final _weight = TextEditingController();

  Exercise? selectedExercise;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.addExercise(locale))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      selectedExercise?.name ?? AppStrings.chooseExercise(locale),
                    ),
                    trailing: const Icon(Icons.search),
                    onTap: () async {
                      final result = await Navigator.push<Exercise>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ExercisePickerPage(),
                        ),
                      );
                      if (result != null) {
                        setState(() => selectedExercise = result);
                      }
                    },
                  ),

                  const SizedBox(height: 8),

                  // Sets
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      AppStrings.sets(locale),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  TextField(
                    controller: _sets,
                    decoration: InputDecoration(
                      hintText: AppStrings.sets(locale),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  // Reps
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                    child: Text(
                      AppStrings.reps(locale),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  TextField(
                    controller: _reps,
                    decoration: InputDecoration(
                      hintText: AppStrings.reps(locale),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  // Weight
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                    child: Text(
                      AppStrings.weight(locale),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  TextField(
                    controller: _weight,
                    decoration: InputDecoration(
                      hintText: AppStrings.weight(locale),
                      suffixText: AppStrings.kg(locale),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedExercise == null
                    ? null
                    : () {
                        final entry = ExerciseEntryEntity(
                          workoutId: widget.workoutId,
                          exerciseName: selectedExercise!.name,
                          sets: int.tryParse(_sets.text) ?? 0,
                          reps: int.tryParse(_reps.text) ?? 0,
                          weight: double.tryParse(_weight.text) ?? 0,
                        );

                        ref
                            .read(exercisesProvider(widget.workoutId).notifier)
                            .addExercise(entry);

                        Navigator.pop(context);
                      },
                child: Text(AppStrings.save(locale)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

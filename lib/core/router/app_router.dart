import 'package:go_router/go_router.dart';

import '../../features/workout/presentation/workout_list_page.dart';
import '../../features/workout/presentation/add_workout_page.dart';
import '../../features/workout/presentation/workout_details_page.dart';
import '../../features/workout/presentation/add_exercise_page.dart';
import '../../features/workout/presentation/exercise_picker_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'workouts',
      builder: (context, state) => const WorkoutListPage(),
    ),

    GoRoute(
      path: '/add-workout',
      name: 'addWorkout',
      builder: (context, state) => const AddWorkoutPage(),
    ),

    GoRoute(
      path: '/workout/:id',
      name: 'workoutDetails',
      builder: (context, state) {
        final workoutId = int.parse(state.pathParameters['id']!);
        return WorkoutDetailsPage(workoutId: workoutId);
      },
    ),

    GoRoute(
      path: '/add-exercise/:workoutId',
      name: 'addExercise',
      builder: (context, state) {
        final workoutId = int.parse(state.pathParameters['workoutId']!);
        return AddExercisePage(workoutId: workoutId);
      },
    ),

    GoRoute(
      path: '/exercise-picker',
      name: 'exercisePicker',
      builder: (context, state) => const ExercisePickerPage(),
    ),
  ],
);

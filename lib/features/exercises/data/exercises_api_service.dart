import 'package:dio/dio.dart';
import 'exercise_model.dart';

class ExercisesApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://wger.de/api/v2/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<Exercise>> fetchExercises() async {
    final response = await _dio.get(
      'exerciseinfo/',
      queryParameters: {
        'limit': 100,
      },
    );

    final results = response.data['results'] as List<dynamic>;

    return results
        .map((e) => Exercise.fromJson(e))
        .where((e) => e.name.isNotEmpty)
        .toList();
  }
}

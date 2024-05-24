import 'dart:math';

import 'package:app_widya_edu/src/data/data_source/exercises_data_source.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/exercises_repository.dart';
import '../models/exercises_model.dart';

class ExercisesRepositoryImpl implements ExercisesRepository {
  final ExercisesDataSource exercisesDataSource;

  ExercisesRepositoryImpl(this.exercisesDataSource,
      [ExercisesRepositoryImpl? exercisesRepositoryImpl]);

  @override
  Future<ExercisesRespon> getExercisesList(String courseId) async {
    return ExercisesDataSource.getExercisesList(courseId);
  }
}

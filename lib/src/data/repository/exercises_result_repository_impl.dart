import 'package:app_widya_edu/src/data/data_source/exercises_result_data_source.dart';
import 'package:app_widya_edu/src/data/models/exercises_answers_model.dart';
import 'package:app_widya_edu/src/data/models/exercises_result_model.dart';
import 'package:app_widya_edu/src/domain/repositories/exercises_result_repository.dart';
import 'package:flutter/material.dart';

class ExercisesResultRepositoryImpl implements ExercisesResultRepository {
  final ExercisesResultDataSource exercisesResultDataSource;

  ExercisesResultRepositoryImpl(this.exercisesResultDataSource,
      [ExercisesResultRepositoryImpl? exercisesResultRepositoryImpl]);

  @override
  Future<ExercisesResultRespon> getExercisesResult(String exercisesIdFk) {
    // TODO: implement getExercisesResult
    return exercisesResultDataSource.getExercisesResult(exercisesIdFk);
  }
}

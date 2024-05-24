import 'dart:math';

import 'package:dio/dio.dart';

import '../../data/models/exercises_model.dart';

abstract class ExercisesRepository {
  Future<ExercisesRespon> getExercisesList(String courseId);
}

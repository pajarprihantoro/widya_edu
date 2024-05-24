import 'package:app_widya_edu/src/data/models/exercises_result_model.dart';

abstract class ExercisesResultRepository {
  Future<ExercisesResultRespon> getExercisesResult(String exercisesIdFk);
}

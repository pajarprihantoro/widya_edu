import 'package:app_widya_edu/src/data/models/exercises_model.dart';
import 'package:app_widya_edu/src/domain/repositories/exercises_repository.dart';

class GetExercisesUsecase {
  final ExercisesRepository repository;
  final String courseId;

  GetExercisesUsecase(this.repository, this.courseId);

  Future<ExercisesRespon?> call() {
    return repository.getExercisesList(courseId);
  }
}

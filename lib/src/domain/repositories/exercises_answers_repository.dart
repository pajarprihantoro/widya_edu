import '../../data/models/exercises_answers_model.dart';

abstract class ExercisesAnswersRepository {
  Future<ExercisesAnswersRespon> submitExercisesAnswers(String exerciseIdFk);
}

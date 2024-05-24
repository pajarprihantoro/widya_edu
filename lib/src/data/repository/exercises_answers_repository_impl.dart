import 'package:app_widya_edu/src/data/data_source/exercises_answers_data_source.dart';
import 'package:app_widya_edu/src/data/models/exercises_answers_model.dart';
import 'package:app_widya_edu/src/domain/repositories/exercises_answers_repository.dart';

class ExercisesAnswerRepositoryImpl implements ExercisesAnswersRepository {
  final ExercisesAnswersDataSource exercisesAnswersDataSource;

  ExercisesAnswerRepositoryImpl(this.exercisesAnswersDataSource,
      [ExercisesAnswerRepositoryImpl? exercisesAnswerRepositoryImpl]);

  @override
  Future<ExercisesAnswersRespon> submitExercisesAnswers(
      String exercisesIdFk) async {
    return exercisesAnswersDataSource.submitExercisesAnswers(exercisesIdFk);
  }
}

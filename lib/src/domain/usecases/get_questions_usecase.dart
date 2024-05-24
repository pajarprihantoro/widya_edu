import 'package:app_widya_edu/src/data/models/exercises_model.dart';
import 'package:app_widya_edu/src/domain/repositories/exercises_repository.dart';

import '../../data/models/questions_model.dart';
import '../repositories/questions_repository.dart';

class GetQuestionsUsecase {
  final QuestionsRepository repository;
  final String exerciseIdFk;
  final String email;

  GetQuestionsUsecase(this.repository, this.exerciseIdFk, this.email);

  Future<List<QuestionsRespon>?> call() {
    return repository.getQuestionsList(exerciseIdFk, email);
  }
}

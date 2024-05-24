import 'package:app_widya_edu/src/data/data_source/questions_data_source.dart';
import 'package:app_widya_edu/src/domain/repositories/questions_repository.dart';

import '../models/questions_model.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsDataSource questionsDataSource;

  QuestionsRepositoryImpl(this.questionsDataSource);

  @override
  Future<List<QuestionsRespon>?> getQuestionsList(
      String exerciseIdFk, String email) async {
    return  questionsDataSource.getQuestionsList(exerciseIdFk, email);
  }
}

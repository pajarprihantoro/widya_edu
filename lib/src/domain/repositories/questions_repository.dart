import '../../data/models/questions_model.dart';

abstract class QuestionsRepository {
  Future<List<QuestionsRespon>?> getQuestionsList(String exerciseIdFk, String email);
}

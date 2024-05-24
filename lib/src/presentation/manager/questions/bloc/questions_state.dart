part of 'questions_bloc.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsSuccess extends QuestionsState {
  final List<Question> questionList;

  QuestionsSuccess({required this.questionList});
}

class QuestionsError extends QuestionsState {
  final String? massage;

  QuestionsError({this.massage = 'error questions state bloc'});
}

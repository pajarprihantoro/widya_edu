part of 'questions_bloc.dart';

@immutable
abstract class QuestionsEvent {}

class GetQuestionsEvent extends QuestionsEvent {
  final String exerciseIdFk;
  final String email;

  GetQuestionsEvent(this.exerciseIdFk, this.email);
}

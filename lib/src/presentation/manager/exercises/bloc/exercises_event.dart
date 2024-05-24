part of 'exercises_bloc.dart';

@immutable
abstract class ExercisesEvent {}

class GetExecisesEvent extends ExercisesEvent {
  final String courseId;

  GetExecisesEvent(this.courseId);
}

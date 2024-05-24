part of 'exercises_bloc.dart';

@immutable
abstract class ExercisesState {}

class ExercisesInitial extends ExercisesState {}

class ExercisesLodiang extends ExercisesState {}

class ExercisesSuccess extends ExercisesState {
  final List<Exercises> exercisesList;

  ExercisesSuccess({required this.exercisesList});

  List<Question> get questionList => questionList;
}

class ExercisesEror extends ExercisesState {
  final String? message;

  ExercisesEror({this.message = 'coba lagi'});
}

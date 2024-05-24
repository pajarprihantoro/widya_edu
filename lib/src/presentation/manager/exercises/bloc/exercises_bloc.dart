import 'dart:async';

import 'package:app_widya_edu/src/data/models/questions_model.dart';
import 'package:app_widya_edu/src/domain/usecases/get_banner_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/get_exercises_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/exercises_model.dart';
import '../../../../domain/repositories/exercises_repository.dart';

part 'exercises_event.dart';
part 'exercises_state.dart';

class ExercisesBloc extends Bloc<ExercisesEvent, ExercisesState> {
  final ExercisesRepository exercisesRepository;

  ExercisesBloc(GetExercisesUsecase getExercisesUsecase,
      {required this.exercisesRepository})
      : super(ExercisesInitial()) {
    on<ExercisesEvent>((event, emit) async {
      if (event is GetExecisesEvent) {
        emit(ExercisesLodiang());
        print('proses pengambilan data');

        final result =
            await exercisesRepository.getExercisesList(event.courseId);

        emit(ExercisesSuccess(exercisesList: result.data ?? []));
      }
    });
  }
}

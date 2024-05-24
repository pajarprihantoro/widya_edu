import 'dart:async';

import 'package:app_widya_edu/src/data/models/questions_model.dart';
import 'package:app_widya_edu/src/domain/repositories/questions_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/usecases/get_questions_usecase.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepository questionsRepository;

  QuestionsBloc(GetQuestionsUsecase getQuestionsUsecase,
      {required this.questionsRepository})
      : super(QuestionsInitial()) {
    on<QuestionsEvent>((event, emit) async {
      if (event is GetQuestionsEvent) {
        emit(QuestionsLoading());
        print('proses pengambilan data');
        List<QuestionsRespon>? result = await questionsRepository
            .getQuestionsList(event.exerciseIdFk, event.email);
        if (result != null) {
          // emit(QuestionsSuccess(questionList: result));
        }
      }
    });
  }
}

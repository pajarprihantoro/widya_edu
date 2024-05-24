import 'dart:async';

import 'package:app_widya_edu/src/data/models/user_by_email_model.dart';
import 'package:app_widya_edu/src/domain/repositories/user_by_email.dart';
import 'package:app_widya_edu/src/domain/usecases/get_banner_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_by_email_event.dart';
part 'user_by_email_state.dart';

class UserByEmailBloc extends Bloc<UserByEmailEvent, UserByEmailState> {
  final UserByEmailRepository userByEmailRepository;

  UserByEmailBloc(GetBannerUsecase getBannerUsecase,
      {required this.userByEmailRepository})
      : super(UserByEmailInitial()) {
    on<UserByEmailEvent>((event, emit) async {
      if (event is GetUserByEmailEvent) {
        emit(UserByEmailLoading());
        print('proses pengambilan data');
        final result = await userByEmailRepository.getUserByEmail();
        try {
          // emit(UserByEmailSuccess(userByEmail: result.data ?? []));
        } catch (e) {
          emit(UserByEmailError(massage: 'gagal load data'));
        }
      }
    });
  }
}

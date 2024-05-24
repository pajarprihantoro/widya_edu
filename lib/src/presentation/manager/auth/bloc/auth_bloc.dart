import 'dart:async';

import 'package:app_widya_edu/src/domain/usecases/is_registed_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/is_signed_in_with_google_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/register_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:app_widya_edu/src/presentation/manager/exercises/bloc/exercises_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignedWithGoogleInUsecase isSignedWithGoogleInUsecase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  final IsRegistedUsecase isRegistedUsecase;
  final RegisterUsecase registerUsecase;

  AuthBloc(this.isSignedWithGoogleInUsecase, this.signInWithGoogleUsecase, this.isRegistedUsecase, this.registerUsecase)
      : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      // IsSigned
      if (event is IsSignedWithGoogleEvent) {
        emit(IsSignInWithGoogleLoading());
        await Future.delayed(Duration(seconds: 3));
        bool isSignIn = isSignedWithGoogleInUsecase();
        if (isSignIn) {
          emit(IsSignInWithGoogleSuccess());
          return;
        }
        emit(IsSignInWithGoogleEror());
      }
      // SignInWithGoogle
      if (event is SignInWithGoogleEvent) {
        emit(SignInWithGoogleLoading());
        String? email = await signInWithGoogleUsecase();
        if (email != null) {
          emit(SignInWithGoogleSuccess(email));
          return;
        }
        emit(SignInWithGoogleEror('eror sign in.....'));
      }
      // IsRegister
       if (event is IsRegisterEvent) {
        emit(IsRegisterLoading());
        await Future.delayed(Duration(seconds: 3));
        bool isRegister = isRegistedUsecase();
        if (isRegister) {
          emit(IsRegisterSuccess());
          return;
        }
        emit(IsRegisterError('csacsa'));
      }
    });
  }
}

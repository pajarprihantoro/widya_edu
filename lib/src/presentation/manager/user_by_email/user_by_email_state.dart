part of 'user_by_email_bloc.dart';

@immutable
abstract class UserByEmailState {}

class UserByEmailInitial extends UserByEmailState {}

class UserByEmailLoading extends UserByEmailState {}

class UserByEmailSuccess extends UserByEmailState {
  final List<UserData>? userByEmail;

  UserByEmailSuccess({
    this.userByEmail,
  });
}

class UserByEmailError extends UserByEmailState {
  String? massage;
  UserByEmailError({required String massage});
}

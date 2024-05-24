part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

final class IsSignedWithGoogleEvent extends AuthEvent {}

final class SignInWithGoogleEvent extends AuthEvent {}

final class IsRegisterEvent extends AuthEvent {}

final class RegisterEvent extends AuthEvent{}

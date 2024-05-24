part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitialState extends AuthState {}

// IsSigned with google
final class IsSignInWithGoogleSuccess extends AuthState {}

final class IsSignInWithGoogleEror extends AuthState {}

final class IsSignInWithGoogleLoading extends AuthState {}

// SignIn with google
final class SignInWithGoogleLoading extends AuthState {}

final class SignInWithGoogleEror extends AuthState {
  final String massage;
  SignInWithGoogleEror(this.massage);
}

final class SignInWithGoogleSuccess extends AuthState {
  final String email;
  SignInWithGoogleSuccess(this.email);
}

// IsRegister
final class IsRegisterLoading extends AuthState {}

final class IsRegisterError extends AuthState {
  final String? massage;
  IsRegisterError(this.massage);
}

final class IsRegisterSuccess extends AuthState {
 
}

// Register
final class RegisterLoading extends AuthState {}

final class RegisterError extends AuthState {
  final String massage;
  RegisterError(this.massage);
}

final class RegisterSuccess extends AuthState {
  final String email;
  RegisterSuccess(this.email);
}

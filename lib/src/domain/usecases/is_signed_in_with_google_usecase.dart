import 'package:app_widya_edu/src/domain/repositories/auth_repository.dart';

class IsSignedWithGoogleInUsecase {
  final AuthRepository repository;

  IsSignedWithGoogleInUsecase(this.repository);

  bool call() {
    return repository.isSignInWithGooleUsecase();
  }
}

import 'package:app_widya_edu/src/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  bool call() {
    return repository.registerUsecase();
  }
}

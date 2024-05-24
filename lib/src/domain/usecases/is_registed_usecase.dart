import 'package:app_widya_edu/src/domain/repositories/auth_repository.dart';

class IsRegistedUsecase {
  final AuthRepository repository;

  IsRegistedUsecase(this.repository);

  bool call() {
    return repository.isRegistedUsecase();
  }
}

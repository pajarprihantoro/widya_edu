import '../../data/models/user_by_email_model.dart';
import '../repositories/user_by_email.dart';

class UpdateUserByEmailUsecase {
  final UserByEmailRepository repository;

  UpdateUserByEmailUsecase(this.repository);

  Future<UserByEmailRespon?> call() {
    return repository.updateUserByEmail();
  }
}

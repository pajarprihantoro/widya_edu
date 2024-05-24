import 'package:app_widya_edu/src/data/models/user_by_email_model.dart';

import '../repositories/user_by_email.dart';

class GetUserByEmailUsecase {
  final UserByEmailRepository repository;

  GetUserByEmailUsecase(this.repository);

  Future<UserByEmailRespon?> call() {
    return repository.getUserByEmail();
  }
  

}

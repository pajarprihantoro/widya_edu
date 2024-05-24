import 'package:app_widya_edu/src/data/models/user_by_email_model.dart';
import 'package:app_widya_edu/src/domain/usecases/get_user_by_email.dart';

abstract class UserByEmailRepository {
  Future<UserByEmailRespon> getUserByEmail();

  Future<UserByEmailRespon> updateUserByEmail();
}

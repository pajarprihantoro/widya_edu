import 'dart:typed_data';

import 'package:app_widya_edu/src/domain/repositories/auth_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../repositories/profile_repository.dart';

class UploadImageUsecase {
  final ProfileRepository repository;

  UploadImageUsecase(this.repository);

  Future<String?> call(XFile file) {
    return repository.uploadImage(file);
  }
}

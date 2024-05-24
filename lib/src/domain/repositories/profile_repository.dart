import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

abstract class ProfileRepository {
  Future<bool> editProfile();

  Future<String?> uploadImage(XFile file);
}

import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<String?> uploadImage(XFile file) async {
    // TODO: implement uploadImage
    try {
      String fileExt = file.path.split('.').last;
      Reference ref = FirebaseStorage.instance
          .ref('files')
          .child('profile_pic')
          .child('img_${DateTime.now().millisecondsSinceEpoch}.$file');

      Uint8List byte = await file.readAsBytes();
      await ref.putData(byte);
      String? downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('eror upload imagee ');
      return null;
    }
  }

  @override
  Future<bool> editProfile() {
    // TODO: implement editProfile
    throw UnimplementedError();
  }
}

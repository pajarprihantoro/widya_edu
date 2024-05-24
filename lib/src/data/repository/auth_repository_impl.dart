import 'package:app_widya_edu/src/data/data_source/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepositoryImpl(this.authDataSource);

  @override
  bool isRegistedUsecase() {
    // TODO: implement isRegistedUsecase
    throw UnimplementedError();
    // return FirebaseAuth.instance.currentUser != null;
  }

  @override
  bool registerUsecase() {
    return FirebaseAuth.instance.currentUser ==
        FirebaseAuth.instance.currentUser;
  }

  @override
  bool isSignInWithGooleUsecase() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<String?> signInWithGoogleUsecase() async {
//     // TODO: implement signInWithGoogleUsecase
    try {
      // pop up pemilihan accont google / sign in google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

// untuk get informasi nya
      final GoogleSignInAuthentication? googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

// untuk sign in level app
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user?.email;
    } catch (e) {
      debugPrint('eror saat login $e');
      return null;
    }
  }
}

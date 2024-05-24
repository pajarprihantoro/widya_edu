abstract class AuthRepository {
  bool isRegistedUsecase();
  bool registerUsecase();
  bool isSignInWithGooleUsecase();
  Future<String?> signInWithGoogleUsecase();
}

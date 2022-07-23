import '../../domain/entities/LoginModel.dart';
import '../models/user.dart';

abstract class IAuthenticationDatasource {
  Future<AppUserModel> signInWithEmailPassword(LoginModel login);

  Future<AppUserModel> createUserEmailPassword(LoginModel login);

  Future<AppUserModel?> checkAuthentication();

  Future<bool> signOut();

  Future<bool> resetPasswordMail(String mail);

  Future<AppUserModel> signInWithGoogle();
}

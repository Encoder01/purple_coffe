import '../../domain/entities/LoginModel.dart';
import '../models/user.dart';

abstract class IAuthenticationDatasource {
  Future<AppUserModel> signIn(LoginModel login);

  Future<AppUserModel> signUp(LoginModel login);

  Future<AppUserModel> checkAuthentication();

  Future<bool> signOut();

  Future<AppUserModel> signInWithGoogle();
}

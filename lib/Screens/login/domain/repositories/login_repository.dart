import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/user.dart';
import '../entities/LoginModel.dart';

abstract class LoginRepository {
  Future<Either<Failure, AppUserModel>> signIn(LoginModel login);

  Future<Either<Failure, AppUserModel>> signInWithGoogle();

  Future<Either<Failure, AppUserModel>> signUp(LoginModel login);
  Future<Either<Failure, AppUserModel>> checkAuthentication();
  Future<Either<Failure, bool>> signOut();
}

import 'package:dartz/dartz.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/user.dart';
import '../entities/LoginModel.dart';

abstract class LoginRepository {
  Future<Either<Failure, AppUserModel>> signInWithEmailLink(LoginModel login);

  Future<Either<Failure, AppUserModel>> signInWithEmailPassword(
      LoginModel login);

  Future<Either<Failure, AppUserModel>> signInWithGoogle();

  Future<Either<Failure, AppUserModel>> createUserEmailPassword(LoginModel login);

  Future<Either<Failure, AppUserModel>> checkAuthentication();

  Future<Either<Failure, bool>> signOut();
}

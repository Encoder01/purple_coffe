import '../../../../core/error/failures.dart';
import '../../domain/entities/LoginModel.dart';
import '../../domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/authentication_datasource.dart';
import '../models/user.dart';

class LoginRepositoryImpl extends LoginRepository {
  final IAuthenticationDatasource _authenticationService;
  LoginRepositoryImpl(this._authenticationService);

  @override
  Future<Either<Failure, AppUserModel>> signIn(LoginModel login) async {
    try {
      final user = await _authenticationService.signIn(login);
      print("user logged");
      return Right(user);
    } catch (exception) {
      print(exception.toString());
      return Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, AppUserModel>> checkAuthentication() async {
    try {
      final user = await _authenticationService.checkAuthentication();
      return Right(user);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUserModel>> signUp(LoginModel login) async {
    try {
      final AppUserModel user = await _authenticationService.signUp(login);
      return Right(user);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUserModel>> signInWithGoogle() async {
    try {
      final AppUserModel user = await _authenticationService.signInWithGoogle();
      return Right(user);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      final user = await _authenticationService.signOut();
      return Right(user);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }
}

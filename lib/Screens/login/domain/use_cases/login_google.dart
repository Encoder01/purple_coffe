import 'package:dartz/dartz.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user.dart';
import '../repositories/login_repository.dart';

class LoginGoogle extends UseCase<AppUserModel, NoParams> {
  final LoginRepository repository;

  LoginGoogle(this.repository);

  @override
  Future<Either<Failure, AppUserModel>> call(NoParams params) async {
    return await repository.signInWithGoogle();
  }
}

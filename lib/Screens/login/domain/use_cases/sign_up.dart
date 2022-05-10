import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/UserModel.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../../core/params/login_params.dart';
import '../repositories/login_repository.dart';

class SignUp extends UseCase<AppUserModel, LoginParams> {
  final LoginRepository loginRepository;

  SignUp(this.loginRepository);

  @override
  Future<Either<Failure, AppUserModel>> call(LoginParams params) async {
    return await loginRepository.createUserEmailPassword(params.login);
  }
}



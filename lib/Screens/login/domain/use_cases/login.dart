import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/params/login_params.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/models/user.dart';
import '../repositories/login_repository.dart';

class LoginUserCase extends UseCase<AppUserModel, LoginParams> {
  final LoginRepository loginRepository;

  LoginUserCase(this.loginRepository);

  @override
  Future<Either<Failure, AppUserModel>> call(LoginParams params) async {
    return  await loginRepository.signInWithEmailPassword(params.login);
  }
}


import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../../core/params/login_params.dart';
import '../repositories/login_repository.dart';

class SignUp extends UseCase<void, LoginParams> {
  final LoginRepository loginRepository;

  SignUp(this.loginRepository);

  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return await loginRepository.signUp(params.login);
  }
}



import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/login_repository.dart';

class CheckAuthenticationUseCase implements UseCase<AppUserModel, NoParams> {
  CheckAuthenticationUseCase(this._authenticationRepository);

  final LoginRepository _authenticationRepository;

  @override
  Future<Either<Failure, AppUserModel>> call(NoParams noParams) async {
    final result = await _authenticationRepository.checkAuthentication();
    return result;
  }
}
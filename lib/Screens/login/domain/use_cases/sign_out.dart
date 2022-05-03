import 'package:dartz/dartz.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

import '../../../../core/error/failures.dart';
import '../repositories/login_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  final LoginRepository repository;

  SignOut(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.signOut();
  }
}

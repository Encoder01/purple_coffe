
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:purple_coffe/Screens/login/domain/repositories/login_repository.dart';
import 'package:purple_coffe/core/error/failures.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

class ResetPassUseCase extends UseCase<void, ResPassParam> {
  final LoginRepository repository;

  ResetPassUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ResPassParam params) async {
    return await repository.resetPasswordMail(params.mail);
  }
}

class ResPassParam extends Equatable{
  String mail;
  ResPassParam(this.mail);

  @override
  List<Object?> get props => [mail];


}

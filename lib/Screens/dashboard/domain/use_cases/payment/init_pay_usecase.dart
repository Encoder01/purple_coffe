import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/payment_repository.dart';
import 'package:purple_coffe/core/error/failures.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

class InitPayUseCase extends UseCase<void, NoParams> {
  final PaymentRepository paymentRepository;

  InitPayUseCase(this.paymentRepository);

  @override
  Future<Either<Failure, void >> call(NoParams params) async {
    return  await paymentRepository.initPlatformState();
  }
}

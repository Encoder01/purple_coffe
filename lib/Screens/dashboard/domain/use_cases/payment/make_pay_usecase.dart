import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/payment_repository.dart';
import 'package:purple_coffe/core/error/failures.dart';
import 'package:purple_coffe/core/params/make_pay_params.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

class MakePayUseCase extends UseCase<void, MakePayParams> {
  final PaymentRepository paymentRepository;

  MakePayUseCase(this.paymentRepository);

  @override
  Future<Either<Failure, void >> call(MakePayParams params) async {
    return  await paymentRepository.makePurchases(params.package, params.context);
  }
}
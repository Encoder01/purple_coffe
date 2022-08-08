import 'package:dartz/dartz.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/payment_repository.dart';
import 'package:purple_coffe/core/error/failures.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

class ShowThreeCreditUseCase extends UseCase<Package, NoParams> {
  final PaymentRepository paymentRepository;

  ShowThreeCreditUseCase(this.paymentRepository);

  @override
  Future<Either<Failure, Package >> call(NoParams params) async {
    return  await paymentRepository.showOneCreditPaywall();
  }
}
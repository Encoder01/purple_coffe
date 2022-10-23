import 'package:dartz/dartz.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/payment_repository.dart';
import 'package:purple_coffe/core/error/failures.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

class InitPayUseCase extends UseCase<CustomerInfo?, NoParams> {
  final PaymentRepository paymentRepository;

  InitPayUseCase(this.paymentRepository);

  @override
  Future<Either<Failure, CustomerInfo? >> call(NoParams params) async {
    return  await paymentRepository.initPlatformState();
  }
}

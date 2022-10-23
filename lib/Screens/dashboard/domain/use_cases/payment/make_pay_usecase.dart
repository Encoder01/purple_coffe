import 'package:dartz/dartz.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/payment_repository.dart';
import 'package:purple_coffe/core/error/failures.dart';
import 'package:purple_coffe/core/params/make_pay_params.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

class MakePayUseCase extends UseCase<CustomerInfo?, MakePayParams> {
  final PaymentRepository paymentRepository;

  MakePayUseCase(this.paymentRepository);

  @override
  Future<Either<Failure, CustomerInfo? >> call(MakePayParams params) async {
    return  await paymentRepository.makePurchases(params.package, params.context);
  }
}
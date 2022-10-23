import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/init_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/make_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/onecredit_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/threecredit_pay_usecase.dart';
import 'package:purple_coffe/core/params/make_pay_params.dart';
import 'package:purple_coffe/core/params/no_params.dart';

class PaymentProvider {
  InitPayUseCase initPayUseCase;
  MakePayUseCase makePayUseCase;
  ShowOneCreditUseCase showOneCreditUseCase;
  ShowThreeCreditUseCase showThreeCreditUseCase;
  CustomerInfo? purchaserInfo;
  PaymentProvider(
    this.initPayUseCase,
    this.showThreeCreditUseCase,
    this.showOneCreditUseCase,
    this.makePayUseCase,
  ) {
    initPlatform();
  }

  Future<void> initPlatform() async {
    final result = await initPayUseCase.call(NoParams());
    result.fold(
      (failure) => errorState(),
      (success) {
        purchaserInfo = success;
      },
    );
  }

  Future<Package?> showOneCredit() async {
    final result = await showOneCreditUseCase.call(NoParams());
    return result.fold(
      (failure) => null,
      (success) {
        return success;
      },
    );
  }

  Future<Package?> showThreeCredit() async {
    final result = await showThreeCreditUseCase.call(NoParams());
    return result.fold(
      (failure) => null,
      (success) {

       return success;
      },
    );
  }

  Future<CustomerInfo?> makePurchase(Package package, BuildContext context) async {
    final result = await makePayUseCase.call(MakePayParams(package, context));
    return result.fold(
      (failure) => null,
      (success) {
       return success;
      },
    );
  }

  void errorState() {
    print('error');

  }
}

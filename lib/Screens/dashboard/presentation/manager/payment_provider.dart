import 'package:flutter/material.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/init_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/make_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/onecredit_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/threecredit_pay_usecase.dart';
import 'package:purple_coffe/core/params/no_params.dart';

class PaymentProvider extends ChangeNotifier {
  InitPayUseCase initPayUseCase;
  MakePayUseCase makePayUseCase;
  ShowOneCreditUseCase showOneCreditUseCase;
  ShowThreeCreditUseCase showThreeCreditUseCase;

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
        print("success");
        notifyListeners();
      },
    );
  }

  void errorState() {
    notifyListeners();
  }
}

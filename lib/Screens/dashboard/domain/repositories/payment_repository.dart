
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purple_coffe/core/error/failures.dart';

abstract class PaymentRepository{
  Future<Either<Failure,CustomerInfo?>> initPlatformState();

  Future<Either<Failure,bool>> resetUser();

  Future<Either<Failure,void>> restoreTransact(BuildContext context);

  Future<Either<Failure,Package>> showOneCreditPaywall();

  Future<Either<Failure,Package>> showThreeCreditPaywall();

  Future<Either<Failure,CustomerInfo?>> makePurchases(Package package, BuildContext context);
}
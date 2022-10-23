import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/payment_datasource.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/payment_repository.dart';
import 'package:purple_coffe/core/error/failures.dart';

class PaymentRepositoyryImpl implements PaymentRepository {
  final PaymentDataSource _paymentDataSource;

  PaymentRepositoyryImpl(this._paymentDataSource);

  @override
  Future<Either<Failure, CustomerInfo?>> initPlatformState() async {
    try {
      final init = await _paymentDataSource.initPlatformState();
      return Right(init);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CustomerInfo?>> makePurchases(
      Package package, BuildContext context) async {
    try {
      final makePurc = await _paymentDataSource.makePurchases(package, context);
      return Right(makePurc);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> resetUser()async {
    try {
      final restUser = await _paymentDataSource.resetUser();
      return Right(restUser);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> restoreTransact(BuildContext context) async {
    try {
      final restore = await _paymentDataSource.restoreTransact(context);
      return Right(restore);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Package>> showOneCreditPaywall() async {
    try {
      final showOne = await _paymentDataSource.showOneCreditPaywall();
      return Right(showOne);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Package>> showThreeCreditPaywall() async {
    try {
      final showThree = await _paymentDataSource.showThreeCreditPaywall();
      return Right(showThree);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }
}

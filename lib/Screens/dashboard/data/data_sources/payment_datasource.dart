import 'dart:async';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

abstract class PaymentDataSource {
  Future<CustomerInfo?> initPlatformState();

  Future<bool> resetUser();

  Future<void> restoreTransact(BuildContext context);

  Future<Package> showOneCreditPaywall();

  Future<Package> showThreeCreditPaywall();

  Future<CustomerInfo?> makePurchases(Package package, BuildContext context);
}

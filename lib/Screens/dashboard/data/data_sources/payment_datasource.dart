import 'dart:async';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

abstract class PaymentDataSource {
  Future<void> initPlatformState();

  Future<bool> resetUser();

  Future<void> restoreTransact(BuildContext context);

  Future<Package> showOneCreditPaywall();

  Future<Package> showThreeCreditPaywall();

  Future<void> makePurchases(Package package, BuildContext context);
}

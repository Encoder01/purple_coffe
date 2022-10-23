import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/payment_datasource.dart';

class PaymentDataSourceImpl implements PaymentDataSource {
  CustomerInfo? purchaserInfo;

  @override
  Future<CustomerInfo?> initPlatformState() async {
    try {
      await Purchases.setDebugLogsEnabled(true);

      PurchasesConfiguration configuration;
      if (Platform.isAndroid) {
        configuration =
            PurchasesConfiguration("goog_LFAHbMnxYTLZbPMWFrdHgXFnuWr");
      } else {
        configuration = PurchasesConfiguration("public_ios_sdk_key");
      }
      await Purchases.configure(configuration);
      purchaserInfo = await Purchases.getCustomerInfo();
      return purchaserInfo;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<CustomerInfo?> makePurchases(Package package, BuildContext context) async {
    try {
      purchaserInfo = await Purchases.purchasePackage(package);
      return purchaserInfo;
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        Scaffold.of(context).showBottomSheet(
          (context) => Text(e.message.toString()),
        );
      }
      print('Fail:$e');
      return null;
    }
  }

  @override
  Future<bool> resetUser() async {
    try {
      purchaserInfo = await Purchases.logOut();
      return true;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> restoreTransact(BuildContext context) async {
    try {
      purchaserInfo = await Purchases.restorePurchases();
      if (kDebugMode) {
        print("*************************************");
      }
      if (purchaserInfo!.allPurchasedProductIdentifiers.isNotEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text("restoresucss"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"),
                  ),
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("sorry"),
                content: const Text("restorefail"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("ok"),
                  ),
                ],
              );
            });
      }
    } on PlatformException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(e.toString()),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          });
    }
  }

  @override
  Future<Package> showOneCreditPaywall() async {
    try {
      final offerings = await Purchases.getOfferings();
      final currentOneCreditProduct =
          offerings.current!.getPackage("credits_coffe_1_package");
      return currentOneCreditProduct!;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Package> showThreeCreditPaywall() async {
    try {
      final offerings = await Purchases.getOfferings();
      final currentThreeCreditProduct =
          offerings.current!.getPackage("credits_coffe_3_package");
      return currentThreeCreditProduct!;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}

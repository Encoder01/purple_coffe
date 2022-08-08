import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/payment_datasource.dart';

class PaymentDataSourceImpl implements PaymentDataSource {
  PurchaserInfo? purchaserInfo;

  @override
  Future<void> initPlatformState() async {
    try {
      await Purchases.setDebugLogsEnabled(true);
      await Purchases.setup("HijTHhuTwuEftAnokGTovRStlVfnBcpZ");
      purchaserInfo = await Purchases.getPurchaserInfo();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> makePurchases(Package package, BuildContext context) async {
    try {
      purchaserInfo = await Purchases.purchasePackage(package);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message!)));
      }
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
      purchaserInfo = await Purchases.restoreTransactions();
      print("*************************************");
      if (purchaserInfo!.allPurchasedProductIdentifiers.isNotEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("restoresucss"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  ),
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("sorry"),
                content: Text("restorefail"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("ok"),
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
      Offerings offerings = await Purchases.getOfferings();
      final currentOneCreditProduct = offerings.current!.getPackage("credits_coffe_1_package");
      return currentOneCreditProduct!;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Package> showThreeCreditPaywall() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      final currentThreeCreditProduct = offerings.current!.getPackage("credits_coffe_3_package");
      return currentThreeCreditProduct!;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}

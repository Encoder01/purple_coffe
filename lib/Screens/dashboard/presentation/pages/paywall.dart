import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/payment_provider.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/user_bloc.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/config/themes/themes.dart';
import 'package:purple_coffe/injection_container.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Paywall extends StatefulWidget {
  const Paywall({Key? key}) : super(key: key);

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  final dasboardController = di.serviceLocator<DashboardFirestoreRepository>();
  Package? oneCredit;
  Package? threeCredit;

  String titleOneCredit = "Annual";
  String descOneCredi = "Annual";
  String priceStringOneCredit = "0.0";
  double priceOneCredit = 0.0;

  String titleThreeCredit = "Annual";
  String descThreeCredi = "Annual";
  String priceStringThreeCredit = "0.0";
  double priceThreeCredit = 0.0;

  @override
  void initState() {
    super.initState();

    Provider.of<PaymentProvider>(context, listen: false).showOneCredit().then((value) {
      oneCredit = value;
      if (value != null) {
        setState(() {
          titleOneCredit = oneCredit!.storeProduct.title.split("(").first;
          priceStringOneCredit = oneCredit!.storeProduct.priceString;
          priceOneCredit = double.parse(oneCredit!.storeProduct.price.toStringAsFixed(2));
        });
      }
    });
    Provider.of<PaymentProvider>(context, listen: false).showThreeCredit().then((value) {
      threeCredit = value;
      if (value != null) {
        setState(() {
          titleThreeCredit = threeCredit!.storeProduct.title.split("(").first;
          priceStringThreeCredit = threeCredit!.storeProduct.priceString;
          priceThreeCredit = double.parse(threeCredit!.storeProduct.price.toStringAsFixed(2));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
            ),
            Image.asset(AppLocalizations.of(context)!.title_path),
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
            ),
            Text(
              AppLocalizations.of(context)!.payment_title,
              style: Themes.stylePurple,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            creditButton(context, titleOneCredit, priceStringOneCredit, oneCredit!),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            creditButton(context, titleThreeCredit, priceStringThreeCredit, threeCredit!),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Image.asset(
              "assets/logo/logo.png",
              width: MediaQuery.of(context).size.width * .5,
            ),
          ],
        ),
      ),
    );
  }

  Container creditButton(BuildContext context, String title, String price, Package package) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
          border: Border.all(color: Themes.mainColor, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: Themes.stylePurple,
          ),
          Text(
            price,
            style: Themes.stylePurple,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () async {
                  if (state is UserLoaded) {
                    final user = await dasboardController.getUserInfo(state.userProfile.uid!);
                    final purchaseInfo =
                        await Provider.of<PaymentProvider>(context, listen: false)
                            .makePurchase(package, context);
                    user.fold((fail) => null, (userData) => setUSerCredit(userData, purchaseInfo));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    side: BorderSide(color: Themes.mainColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                child: Text(
                  AppLocalizations.of(context)!.payment_button,
                  style: Themes.stylePurple,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future setUSerCredit(AppUserModel appUserModel, CustomerInfo? customerInfo) async {
    List<dynamic> tempListForCredit = appUserModel.availableCredit!.toList();
    customerInfo!.nonSubscriptionTransactions.forEach((element) {
      bool isEqueal = false;
      appUserModel.availableCredit?.forEach((crediId) {
        if (crediId['credit_id'] == element.revenueCatIdentifier) {
          isEqueal = true;
        }
      });
      if (!isEqueal) {
        print(element);
        tempListForCredit.add({
          'credit_count': element.productIdentifier.contains('one') ? 1 : 3,
          'credit_id': element.revenueCatIdentifier
        });
      }
    });
    BlocProvider.of<UserBloc>(context).add(
      SetUser(
        AppUserModel(
          uid: appUserModel.uid,
          fTellId: appUserModel.fTellId,
          name: appUserModel.name,
          email: appUserModel.email,
          sex: appUserModel.sex,
          birthDate: appUserModel.birthDate,
          availableCredit: tempListForCredit,
        ),
      ),
    );
  }
}

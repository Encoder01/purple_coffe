import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/payment_provider.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/user_bloc.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/config/routes/router.gr.dart';
import 'package:purple_coffe/config/themes/themes.dart';
import 'package:purple_coffe/injection_container.dart' as di;
import 'package:provider/provider.dart';


class DashBoard extends StatefulWidget {
  DashBoard(this.appUserModel);

  AppUserModel appUserModel;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dasboardController = di.serviceLocator<DashboardFirestoreRepository>();
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUser(widget.appUserModel.uid!));
    OneSignal.shared.setEmail(email: widget.appUserModel.email!);
    initPayment(widget.appUserModel,Provider.of<PaymentProvider>(context, listen: false).purchaserInfo);
    super.initState();
  }

  Future initPayment(AppUserModel appUserModel,CustomerInfo? customerInfo) async {
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

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: Themes.gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AutoTabsScaffold(
        backgroundColor: Colors.transparent,
        homeIndex: 0,
        routes: [
          SendFortuneTells(user: widget.appUserModel),
          MyFortuneTells(user: widget.appUserModel, onTap: (value) {}),
          const Paywall(),
          ProfileRoute(appUserModel: widget.appUserModel),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            backgroundColor: Themes.gradientColors.last,
            elevation: 0,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Themes.mainColor),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.chatbox_ellipses, color: Themes.mainColor),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.pricetag, color: Themes.mainColor),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Themes.mainColor),
                label: "",
              ),
            ],
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 33,
            onTap: (v){
              print(tabsRouter.activeIndex);
              tabsRouter.setActiveIndex(v);
            },
          );
        },
      ),
    );
  }
}

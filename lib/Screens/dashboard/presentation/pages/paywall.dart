import 'package:flutter/material.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/payment_provider.dart';
import 'package:purple_coffe/config/themes/themes.dart';
import 'package:provider/provider.dart';
class Paywall extends StatelessWidget {
    const Paywall({Key? key}) : super(key: key);

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
            Image.asset("assets/logo/title_tr.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
            ),
            Text(
              "Buy Credits",
              style: Themes.stylePurple,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            creditButton(context, "20"),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            creditButton(context, "50"),
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

  Container creditButton(BuildContext context, String price) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
          border: Border.all(color: Themes.mainColor, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "1 Credit",
            style: Themes.stylePurple,
          ),
          Text(
            "$price USD",
            style: Themes.stylePurple,
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<PaymentProvider>(context,listen: false).initPlatform();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                side: BorderSide(color: Themes.mainColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text(
              "Buy",
              style: Themes.stylePurple,
            ),
          ),
        ],
      ),
    );
  }
}

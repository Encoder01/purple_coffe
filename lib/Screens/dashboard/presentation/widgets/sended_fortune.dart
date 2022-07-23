import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:purple_coffe/config/env/env.dart';
import 'package:purple_coffe/config/themes/themes.dart';

import '../../../../core/constants/app_constants.dart';

class SendedFortune extends StatelessWidget {
  const SendedFortune({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    int fortuneTime = AppEnvironment.appEnv.readedDailyFortune! >=
            AppEnvironment.appEnv.dailyFortune!
        ? AppEnvironment.appEnv.busyFortuneTime!
        : AppEnvironment.appEnv.fortuneTime!;
    pool.play(kSoundId!);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Themes.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .06,
                  ),
                  Padding(
                    padding:   EdgeInsets.all(MediaQuery.of(context).size.height * .03),
                    child: Image.asset(
                      "assets/logo/title_en.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  Padding(
                    padding:   EdgeInsets.all(MediaQuery.of(context).size.height * .05),
                    child: Text(
                      "We got your order! Your coffe reading will be sent to you within $fortuneTime hours Thank You!",
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        fontSize: 21,
                        color: Themes.mainColor,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .10,
                  ),
                    Padding(
                      padding:   EdgeInsets.all(MediaQuery.of(context).size.height * .05),
                      child: Text("Thank you for choosing the purple coffe cup.",
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        fontSize: 21,
                        color: Themes.mainColor,

                      ),),
                    ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Image.asset(
                    "assets/logo/logo.png",
                    width: 100,
                    height: 160,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                   context.router.pop();
                  },
                  iconSize: 31,
                  icon:   Icon(Icons.clear,color: Themes.mainColor,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/fortune_bloc.dart';
import 'package:purple_coffe/Screens/login/presentation/pages/start_up.dart';
import 'package:purple_coffe/config/env/env.dart';
import 'package:purple_coffe/core/constants/firebase_constants.dart';
import 'package:purple_coffe/core/models/app_env.dart';
import 'Screens/dashboard/presentation/manager/user_bloc.dart';
import 'Screens/login/presentation/manager/login_bloc.dart';
import 'config/themes/themes.dart';
import 'core/constants/functions.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<bool> initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    await di.init();
    AppEnvironment.appEnv = await getEnvironment() ?? AppEnv.empty();
    await loadSound("assets/sounds/sent_fortune.m4a");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization(),
      builder: (BuildContext context, AsyncSnapshot<bool> state) {
        print(state.connectionState.name);
        if (state.connectionState != ConnectionState.done) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: Themes.gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 80,),
                Image.asset("assets/logo/logo.png",width: 250,),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/logo/title_en.png"),
                ),
              ],
            ),
          );
        } else {
         return MyApp();
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) =>
          LoginBloc(
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
          )
            ..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) =>
              FortuneBloc(
                di.serviceLocator(),
                di.serviceLocator(),
                di.serviceLocator(),
              ),
        ),
        BlocProvider(
          create: (context) =>
              UserBloc(
                di.serviceLocator(),
                di.serviceLocator(),
              ),
        )
      ],
      child: MaterialApp(
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const StartupScreen(),
      ),
    );
  }
}

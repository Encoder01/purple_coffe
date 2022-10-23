import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/fortune_bloc.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/payment_provider.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/user_bloc.dart';
import 'package:purple_coffe/Screens/login/presentation/manager/login_bloc.dart';
import 'package:purple_coffe/config/env/env.dart';
import 'package:purple_coffe/config/routes/router.gr.dart';
import 'package:purple_coffe/config/themes/themes.dart';
import 'package:purple_coffe/core/constants/firebase_constants.dart';
import 'package:purple_coffe/core/constants/functions.dart';
import 'package:purple_coffe/core/models/app_env.dart';
import 'package:purple_coffe/injection_container.dart' as di;
import 'package:provider/provider.dart' as prv;
import 'core/constants/app_constants.dart';
import 'firebase_options.dart';

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const SplashScreen());
}

final _appRouter = AppRouter();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<String> initialization() async {
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
    AppEnvironment.appEnv = await getEnvironment() ?? AppEnv.empty();
     loadSound("assets/sounds/sent_fortune.m4a");
     pool.play(kSoundId!).whenComplete(() => null);
    await Future.delayed(const Duration(seconds: 2));

     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
     OneSignal.shared.setAppId(koneSignalKey);

     OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {
      if (kDebugMode) {
        print("Accepted permission: $accepted");
      }
    });
    return Future.value("true");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: initialization(),
      builder: (BuildContext context, AsyncSnapshot<String> state) {
        if (state.data == null) {
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
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  "assets/logo/logo.png",
                  width: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
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
  PaymentProvider paymentProvider = PaymentProvider(
    di.serviceLocator(),
    di.serviceLocator(),
    di.serviceLocator(),
    di.serviceLocator(),
  );
  MyApp(){
   paymentProvider.initPlatform();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
          )..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => FortuneBloc(
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
            di.serviceLocator(),
          ),
        ),
        BlocProvider(
          create: (context) => UserBloc(
            di.serviceLocator(),
            di.serviceLocator(),
          ),
        )
      ],
      child: prv.MultiProvider(
        providers: [
          prv.Provider<PaymentProvider>(
            create: (context) => paymentProvider,
          )
        ],
        child: MaterialApp.router(
          theme: Themes.lightTheme,
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: kSnackbarKey,
          routeInformationParser:
              _appRouter.defaultRouteParser(includePrefixMatches: true),
          routerDelegate: _appRouter.delegate(),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/fortune_bloc.dart';
import 'package:purple_coffe/Screens/login/presentation/pages/start_up.dart';
import 'Screens/login/presentation/manager/login_bloc.dart';
import 'config/themes/themes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          )..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => FortuneBloc(
            di.serviceLocator(),
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_coffe/Screens/login/presentation/manager/login_bloc.dart';
import 'package:purple_coffe/config/routes/router.gr.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return AutoRouter.declarative(
            routes: (context) => [
              if (state is ErrorLoggedState)
                  const LoginRoute()
              else if (state is LoginAuthenticated)
                DashBoard(appUserModel: state.appUserModel, children: [
                  SendFortuneTells(user: state.appUserModel),
                  MyFortuneTells(user: state.appUserModel, onTap: (value) {}),
                  const Paywall(),
                  ProfileRoute(appUserModel: state.appUserModel),
                ])
              else
                const LoginRoute()
            ],
          );
        },
      ),
    );
  }
}

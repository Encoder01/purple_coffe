import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/dashboard.dart';
import 'package:purple_coffe/Screens/login/presentation/manager/login_bloc.dart';
import 'package:purple_coffe/Screens/login/presentation/pages/login_page.dart';

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
        builder:(context, state) {
          if (state is ErrorLoggedState) {
            return LoginPage();
          } else if (state is LoginAuthenticated) {
            return   const DashBoard();
          }  else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

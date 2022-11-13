import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_coffe/Screens/login/presentation/dto/login_dto.dart';
import 'package:purple_coffe/Screens/login/presentation/manager/login_bloc.dart';
import 'package:purple_coffe/Screens/login/presentation/widgets/body_header.dart';
import 'package:purple_coffe/Screens/login/presentation/widgets/text_form.dart';
import 'package:purple_coffe/core/constants/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String inputLogin = "";
  late String inputPass = "";
  late String inputPassConfirm='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/arkaplan.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const BodyHeader(),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                AppLocalizations.of(context)!.sign_create,
                                style: TextStyle(color: Colors.yellow, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormWidget(AppLocalizations.of(context)!.sign_email, false,
                                  (value) {
                                inputLogin = value;
                              }),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormWidget(AppLocalizations.of(context)!.sign_password, true,
                                  (value) {
                                inputPass = value;
                              }),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormWidget(AppLocalizations.of(context)!.sign_password, true,
                                  (value) {
                                inputPassConfirm = value;
                              }),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(inputLogin);
                                  if (emailValid) {
                                    if (inputPass == inputPassConfirm && inputPass!='' && inputPassConfirm!='') {
                                      final loginDTO = LoginDTO(
                                          email: inputLogin,
                                          password: inputPass,
                                          emailLink: inputPass);
                                      BlocProvider.of<LoginBloc>(context)
                                          .add(SignUpWithEmailPassword(loginDTO));
                                      Future.delayed(const Duration(seconds: 1), () {
                                        Navigator.of(context).pop();
                                      });
                                    } else {
                                      busyDialog(
                                        AppLocalizations.of(context)!.sign_err_2,true,
                                      );
                                    }
                                  } else {
                                    busyDialog(
                                      AppLocalizations.of(context)!.sign_err_1,true,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple.withOpacity(0.7),
                                  onSurface: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  minimumSize:
                                      Size(MediaQuery.of(context).size.width * .4, 45),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.sign_signup,
                                  style: TextStyle(
                                      color: Colors.yellow.withOpacity(0.9), fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 25,
                left: 8,
                child: IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  iconSize: 35,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/Screens/login/presentation/dto/login_dto.dart';
import 'package:purple_coffe/Screens/login/presentation/manager/login_bloc.dart';
import 'package:purple_coffe/Screens/login/presentation/widgets/body_header.dart';
import 'package:purple_coffe/Screens/login/presentation/widgets/text_form.dart';
import 'package:purple_coffe/config/routes/router.gr.dart';
import 'package:purple_coffe/config/themes/themes.dart';
import 'package:purple_coffe/core/constants/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:purple_coffe/helpers/show_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? inputLogin;
  String? inputPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/arkaplan.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BodyHeader(),
                bodyForm(),
                Text(
                  AppLocalizations.of(context)!.sign_or.toUpperCase(),
                  style: TextStyle(
                    color: Themes.mainColor,
                    fontSize: 21,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                bodyRegisterButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bodyForm() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            TextFormWidget(AppLocalizations.of(context)!.sign_email, false, (value) {
              inputLogin = value;
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            TextFormWidget(AppLocalizations.of(context)!.sign_password, true, (value) {
              inputPass = value;
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            ElevatedButton(
              onPressed: () {
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(inputLogin!);
                if (emailValid) {
                  if (inputPass != "" && inputPass != null) {
                    final loginDTO = LoginDTO(
                        email: inputLogin!, password: inputPass, emailLink: inputPass);
                    print(loginDTO);
                    BlocProvider.of<LoginBloc>(context).add(LogInWithEmailPassword(loginDTO));
                  } else {
                    busyDialog(AppLocalizations.of(context)!.sign_err_8, true);
                  }
                } else {
                  busyDialog(AppLocalizations.of(context)!.sign_err_1, true);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple.withOpacity(0.7),
                onSurface: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width * .4, 45),
              ),
              child: Text(
                AppLocalizations.of(context)!.sign_login,
                style: TextStyle(color: Themes.mainColor, fontSize: 15),
              ),
            ),
            TextButton(
                onPressed: () {
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(inputLogin ?? '');
                  if (emailValid) {
                    BlocProvider.of<LoginBloc>(context).add(ResPassMail(inputLogin!));
                  } else {
                    busyDialog(AppLocalizations.of(context)!.sign_err_1, true);
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.sign_forget,
                  style: TextStyle(color: Themes.mainColor, fontSize: 13),
                ))
          ],
        ),
      ),
    );
  }

  Widget bodyRegisterButtons() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
        Text(
          AppLocalizations.of(context)!.sign_create,
          style: TextStyle(color: Themes.mainColor, fontSize: 16),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(LogInWithGoogle());
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Themes.mainColor, width: 2.5),
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            minimumSize: Size(MediaQuery.of(context).size.width * .8, 45),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Ionicons.logo_google,
                color: Themes.mainColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)!.sign_google,
                style: TextStyle(color: Themes.mainColor, fontSize: 15),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        ElevatedButton(
          onPressed: () {
            context.router.push(SignUpRoute());
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Themes.mainColor, width: 2.5),
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            minimumSize: Size(MediaQuery.of(context).size.width * .8, 45),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.mail,
                color: Themes.mainColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)!.sign_mail,
                style: TextStyle(color: Themes.mainColor, fontSize: 15),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .033,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            AppLocalizations.of(context)!.sign_desc,
            textAlign: TextAlign.center,
            style: TextStyle(color: Themes.mainColor, fontSize: 12),
          ),
        )
      ],
    );
  }
}

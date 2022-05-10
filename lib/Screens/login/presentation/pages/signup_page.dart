import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/Screens/login/presentation/widgets/body_header.dart';

import '../dto/login_dto.dart';
import '../manager/login_bloc.dart';
import '../widgets/text_form.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String inputLogin;
  late String inputPass;
  late String inputPassConfirm;

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
                              const Text(
                                "Kayıt Ol",
                                style: TextStyle(color: Colors.yellow, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormWidget("Email", false, (value) {
                                inputLogin = value;
                              }),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormWidget("Password", true, (value) {
                                inputPass = value;
                              }),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormWidget("Password", true, (value) {
                                inputPassConfirm = value;
                              }),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final loginDTO = LoginDTO(
                                      email: inputLogin,
                                      password: inputPass,
                                      emailLink: inputPass);
                                  print(loginDTO);
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(SignUpWithEmailPassword(loginDTO));

                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple.withOpacity(0.7),
                                  onSurface: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * .4, 45),
                                ),
                                child: Text(
                                  "Kayıt Yap",
                                  style: TextStyle(
                                      color: Colors.yellow.withOpacity(0.9),
                                      fontSize: 16),
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
                    Navigator.pop(context);
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

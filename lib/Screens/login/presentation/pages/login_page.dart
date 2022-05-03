import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../../../../injection_container.dart';
import '../dto/login_dto.dart';
import '../manager/login_bloc.dart';


class LoginPage extends StatelessWidget {
    LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String inputLogin;
  late String inputPassword;
  @override
  Widget build(BuildContext context) {
    return _buildForm();
  }
    Widget _buildForm() {
      return Scaffold(
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Placeholder(
                  fallbackWidth: 150,
                  fallbackHeight: 100,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                PlatformTextFormField(
                  hintText: 'Enter the username',
                  onChanged: (value) {
                    inputLogin = value;
                  },
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return value!.isEmpty ? 'Username is mandatory' : null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                PlatformTextFormField(
                  obscureText: true,
                  hintText: 'Enter the password',
                  onChanged: (value) {
                    inputPassword = value;
                  },
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return value!.isEmpty ? 'Password is mandatory' : null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                PlatformElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final loginDTO = LoginDTO(
                        username: inputLogin,
                        password: inputPassword,
                      );
                    }
                  },
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ),
      );
    }
}

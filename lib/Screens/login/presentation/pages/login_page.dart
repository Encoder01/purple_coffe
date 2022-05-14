import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:purple_coffe/Screens/login/presentation/pages/signup_page.dart';
import '../../../../config/themes/themes.dart';
import '../dto/login_dto.dart';
import '../manager/login_bloc.dart';
import '../widgets/body_header.dart';
import '../widgets/text_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String inputLogin;
  late String inputPass;

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
              children: [const BodyHeader(), bodyForm(), bodyRegisterButtons()],
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
            TextFormWidget("Email", false, (value) {
              inputLogin = value;
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            TextFormWidget("Password", true, (value) {
              inputPass = value;
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            ElevatedButton(
              onPressed: () {
                final loginDTO = LoginDTO(
                    email: inputLogin,
                    password: inputPass,
                    emailLink: inputPass);
                print(loginDTO);
                BlocProvider.of<LoginBloc>(context)
                    .add(LogInWithEmailPassword(loginDTO));
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
                "Login",
                style: TextStyle(color: Themes.mainColor, fontSize: 16),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot my password",
                  style: TextStyle(color: Themes.mainColor),
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
          "Create Your Account",
          style: TextStyle(color: Themes.mainColor, fontSize: 18),
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
          child: Text(
            "Continue With Google",
            style: TextStyle(color: Themes.mainColor),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ));
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
          child: Text(
            "Continue With Email",
            style: TextStyle(color: Themes.mainColor),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .033,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            "By registering or logging in, I declare that I have read and accepted the Terms of Use and Privacy.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Themes.mainColor),
          ),
        )
      ],
    );
  }
}

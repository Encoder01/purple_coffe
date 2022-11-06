import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/user_bloc.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/elevated_button.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/profil_textform.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/Screens/login/presentation/manager/login_bloc.dart';
import 'package:purple_coffe/config/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(this.appUserModel);

  AppUserModel appUserModel;
  TextEditingController? textEditingController1;
  TextEditingController? textEditingController2;
  TextEditingController? textEditingController3;
  TextEditingController? textEditingController4;
  TextEditingController? availableCredit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            AppLocalizations.of(context)!.profile_title,
            style: TextStyle(
              color: Themes.mainColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(LoggedOut());
              //usually called after the user logs out of your app
              OneSignal.shared.logoutEmail();
            },
            child: Text(
              AppLocalizations.of(context)!.profile_logout,
              style: TextStyle(
                color: Themes.mainColor,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            textEditingController1 = TextEditingController(text: state.userProfile.name);
            textEditingController2 = TextEditingController(text: state.userProfile.email);
            textEditingController3 = TextEditingController(text: state.userProfile.sex);
            textEditingController4 = TextEditingController(text: state.userProfile.birthDate);
            int kredi=0;  state.userProfile.availableCredit?.forEach((element) {
              kredi += element['credit_count'] as int;
            });
            availableCredit = TextEditingController(text:kredi.toString());
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ProfilTextFormWidget(
                    formTitle: AppLocalizations.of(context)!.profile_name,
                    formHint: "",
                    controller: textEditingController1!,
                  ),
                  ProfilTextFormWidget(
                    formTitle: AppLocalizations.of(context)!.profile_mail,
                    controller: textEditingController2!,
                    formHint: 'email',
                  ),
                  ProfilTextFormWidget(
                    formTitle: AppLocalizations.of(context)!.profile_sex,
                    formHint: "",
                    controller: textEditingController3!,
                  ),
                  ProfilTextFormWidget(
                    formTitle: AppLocalizations.of(context)!.profile_date,
                    formHint: "dd/mm/YY",
                    controller: textEditingController4!,
                  ),
                  ProfilTextFormWidget(
                    formTitle: AppLocalizations.of(context)!.profile_credit,
                    formHint: "kredin",
                    controller: availableCredit!,
                  ),
                  ElevatedButtonWidget(
                    onPress: () {
                      BlocProvider.of<UserBloc>(context).add(
                        SetUser(
                          AppUserModel(
                            uid: appUserModel.uid,
                            fTellId: appUserModel.fTellId,
                            name: textEditingController1!.text,
                            email: appUserModel.email,
                            sex: textEditingController3!.text,
                            birthDate: textEditingController4!.text,
                            availableCredit: appUserModel.availableCredit,
                          ),
                        ),
                      );
                    },
                    text: AppLocalizations.of(context)!.profile_button,
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

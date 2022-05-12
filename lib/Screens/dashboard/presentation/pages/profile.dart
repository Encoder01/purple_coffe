import 'package:flutter/material.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/profil_textform.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';

import '../../../../config/themes/themes.dart';
import '../widgets/elevated_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(this.appUserModel);

  AppUserModel appUserModel;

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
            "Profilim",
            style: TextStyle(
              color: Themes.mainColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Çıkış Yap",
              style: TextStyle(
                color: Themes.mainColor,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ProfilTextFormWidget(
            formTitle: "Ad Soyad",
            formHint: appUserModel.name!,
          ),
          ProfilTextFormWidget(
            formTitle: "E-Posta Adresi",
            formHint: appUserModel.email!,
          ),
          ProfilTextFormWidget(
            formTitle: "Cinsiyet",
            formHint: appUserModel.sex!,
          ),
          ProfilTextFormWidget(
            formTitle: "Doğum Tarihi",
            formHint: appUserModel.birthDate!.toString(),
          ),
          ElevatedButtonWidget(
            onPress: () {},
            text: "Güncelle",
          )
        ],
      ),
    );
  }
}

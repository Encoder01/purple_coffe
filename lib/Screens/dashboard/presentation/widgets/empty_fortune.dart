import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/config/themes/themes.dart';

import '../../../../config/routes/router.gr.dart';
import 'elevated_button.dart';

class EmptyFortuneWidget extends StatelessWidget {
  EmptyFortuneWidget({Key? key, required this.user}) : super(key: key);
  final AppUserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.purple),
          child: const Icon(Icons.mail, size: 52),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Gelen Kutusu Boş",
          style: TextStyle(
            color: Themes.mainColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButtonWidget(onPress: () => context.router.navigate(SendFortuneTells(user: user)), text: "Fal Baktır")
      ],
    );
  }
}

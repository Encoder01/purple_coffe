import 'package:flutter/material.dart';
import 'package:purple_coffe/config/themes/themes.dart';

class ProfilTextFormWidget extends StatelessWidget {
  ProfilTextFormWidget(
      {required this.formTitle,
      required this.formHint,
      required this.controller});

  String formTitle;
  String formHint;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formTitle,
            style: TextStyle(
              color: Themes.mainColor,
              fontSize: 13,
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(hintText: formHint),
          )
        ],
      ),
    );
  }
}

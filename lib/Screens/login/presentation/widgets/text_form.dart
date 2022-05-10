import 'package:flutter/material.dart';
import 'package:purple_coffe/config/themes/themes.dart';

class TextFormWidget extends StatelessWidget {
  TextFormWidget(this.hintText, this.isPass,this.onChanged);
  Function(String) onChanged;
  String hintText;
  bool isPass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:   BorderSide(color: Themes.mainColor, width: 2.5),
          ),
          contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:  BorderSide(color: Themes.mainColor, width: 2.5),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Themes.mainColor),
        ),
        obscureText: isPass,
        cursorColor: Themes.mainColor,
        style: TextStyle(color:Themes.mainColor),
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        validator: (String? value) {
          return value!.isEmpty ? 'Username is mandatory' : null;
        },
      ),
    );
  }
}

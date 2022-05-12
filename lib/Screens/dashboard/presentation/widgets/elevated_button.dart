import 'package:flutter/material.dart';

import '../../../../config/themes/themes.dart';

// ignore: must_be_immutable
class ElevatedButtonWidget extends StatelessWidget {
    ElevatedButtonWidget({this.text,this.onPress,Key? key}) : super(key: key);
  String? text;
  Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          primary: Themes.subColor,
          minimumSize: Size(MediaQuery.of(context).size.width*.6, 40)
      ),
      child: Text(text!,style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}

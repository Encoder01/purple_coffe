import 'package:flutter/material.dart';

import '../../../../config/themes/themes.dart';

class ColoredText extends StatelessWidget {
  const ColoredText({Key? key, required this.data}) : super(key: key);
 final String data;
  @override
  Widget build(BuildContext context) {
    return Text(data, textAlign: TextAlign.center,
    style:   TextStyle(
    color:Themes.mainColor,
    fontSize: 18,
    height: 1.25,
    letterSpacing: .5,
    fontFamily: "Avenir"),);
  }
}

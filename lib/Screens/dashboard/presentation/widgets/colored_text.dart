import 'package:flutter/material.dart';

class ColoredText extends StatelessWidget {
  const ColoredText({Key? key, required this.data}) : super(key: key);
 final String data;
  @override
  Widget build(BuildContext context) {
    return Text(data, textAlign: TextAlign.center,
    style: const TextStyle(
    color: Color.fromRGBO(174, 106, 37, 1),
    fontSize: 18,
    height: 1.25,
    letterSpacing: .5,
    fontFamily: "Avenir"),);
  }
}

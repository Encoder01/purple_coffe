import 'package:flutter/material.dart';

class Themes{

  static Color mainColor = Color.fromRGBO(206, 141, 71, 1.0);
  static Color subColor = Color.fromRGBO(201, 131, 46, 1.0);
  static Color whiteColor = Colors.white;
  static Color greyColor = Colors.grey.shade200;

  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: mainColor),
    primaryColor: mainColor,
    fontFamily: "Avenir",
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: mainColor)
  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: subColor),
    primaryColor: subColor,
  );
}
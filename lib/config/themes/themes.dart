import 'package:flutter/material.dart';

class Themes{

  static Color mainColor = Colors.purple;
  static Color subColor = Colors.brown;
  static Color whiteColor = Colors.white;
  static Color greyColor = Colors.grey.shade200;

  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: mainColor),
    primaryColor: mainColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: mainColor)
  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: subColor),
    primaryColor: subColor,
  );
}
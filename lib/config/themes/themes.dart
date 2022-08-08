import 'package:flutter/material.dart';

mixin Themes {
  static Color mainColor = const Color(0xFFf7ba56);
  static Color subColor = const Color(0xFFde943b);
  static List<Color> gradientColors = [
    const Color(0xFF612883),
    const Color(0xFF5c226f),
    const Color(0xFF541c64),
    const Color(0xFF461c52),
  ];

  static TextStyle stylePurple =TextStyle(
      color:Themes.mainColor,
      height: 1.25,
      letterSpacing: .5,
      fontFamily: "Avenir");

  static final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: mainColor),
      primaryColor: mainColor,
      fontFamily: "Avenir",
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: mainColor));

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: subColor),
    primaryColor: subColor,
  );
}

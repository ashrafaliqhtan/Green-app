import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: lightBackground,
      primary: Colors.white,
      secondary: Color(0xff49B291),
      onPrimaryContainer: pureWhite,
      onSecondary: Color(0xff49B291),
    ));

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: darkBackground,
    primary: Color(0xff7D7C7C),
    secondary: Colors.white,
    onSecondary: Color(0xff49B291),
    onPrimaryContainer: Color(0xff7D7C7C),
  ),
);

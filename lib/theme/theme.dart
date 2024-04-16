import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

Map<String, ThemeData> appThemes={
  'Light': ThemeData(
    scaffoldBackgroundColor: lightBackground,
    textTheme: const TextTheme().apply(
      bodyColor: pureWhite,),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    primaryColor:pureWhite,
    unselectedWidgetColor: green,
  ),
  'Dark':ThemeData(
    scaffoldBackgroundColor: darkBackground,
    textTheme: const TextTheme().apply(
      bodyColor: pureWhite,),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: darkTextF),
    brightness: Brightness.dark,
    primaryColor:darkTextF ,
        unselectedWidgetColor: grey,

  ),
};

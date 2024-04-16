// import 'package:flutter/material.dart';
// import 'package:green_saudi_app/utils/colors.dart';

// ThemeData lightMode = ThemeData(
//     brightness: Brightness.light,
//     colorScheme: ColorScheme.light(
//       background: lightBackground,
//       primary: Colors.white,
//       secondary: Color(0xff49B291),
//       onPrimaryContainer: Colors.white,
//       onSecondary: Color(0xff49B291),
//       onSecondaryContainer: Colors.black38,
//       onPrimary: Colors.white,
//     ));

// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: ColorScheme.dark(
//     background: darkBackground,
//     primary: Color(0xff7D7C7C),
//     secondary: Colors.white,
//     onSecondary: Color(0xff49B291),
//     onPrimaryContainer: Color(0xff7D7C7C),
//     onSecondaryContainer: Colors.white,
//     onPrimary: Colors.white,
//   ),
// );

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
  ),
  'Dark':ThemeData(
    scaffoldBackgroundColor: darkBackground,
    textTheme: const TextTheme().apply(
      bodyColor: pureWhite,),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: darkTextF),
    brightness: Brightness.dark,
    primaryColor:darkTextF ,
  ),
};

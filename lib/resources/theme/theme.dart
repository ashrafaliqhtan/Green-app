import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';

Map<String, ThemeData> appThemes={
  'Light': ThemeData(
    scaffoldBackgroundColor: lightBackground,
    textTheme: const TextTheme().apply(
      bodyColor: black,),
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
    primaryColor:pureWhite ,
        unselectedWidgetColor: grey,

  ),
};


TimePickerThemeData customTimePicker() {
  return TimePickerThemeData(
    
    cancelButtonStyle:  const ButtonStyle( 
        backgroundColor: MaterialStatePropertyAll(
      Color(0xFF65B19F),
    )),
    confirmButtonStyle: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
      Color(0xFF65B19F),
    )),
    backgroundColor: Colors.white,
    hourMinuteShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Color(0xFF65B19F), width: 4),
    ),
    dayPeriodBorderSide: const BorderSide(color: Color(0xFF65B19F), width: 4),
    dayPeriodColor: Colors.blueGrey.shade600,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Color(0xFF65B19F), width: 4),
    ),
    dayPeriodTextColor: Colors.white,
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Color(0xFF65B19F), width: 4),
    ),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? const Color(0xFF65B19F)
            : const Color(0xFFF8F8F6)),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.white
            : const Color(0xFF65B19F)),
    dialHandColor: Colors.blueGrey.shade700,
    dialBackgroundColor: Colors.blueGrey.shade800,
    hourMinuteTextStyle:
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    dayPeriodTextStyle:
        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    helpTextStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(

      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? const Color(0xFF65B19F)
            : Colors.white),
    entryModeIconColor: const Color(0xFF65B19F),
  );
}

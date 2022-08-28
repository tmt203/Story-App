import 'package:flutter/material.dart';

ThemeData themeData() {
  const fontFamily = 'Open Sans';
  TextTheme textTheme = const TextTheme(
    headline1: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
    ),
    headline2: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
    ),
    headline3: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
    ),
    headline5: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
    ),
    headline6: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w800,
    ),
  );

  return ThemeData(
    textTheme: textTheme,
  );
}

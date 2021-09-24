import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData customTheme = ThemeData(
  //fontFamily: 'montserrat',
  primaryColor: Colors.white,
  accentColor: Colors.white,
  scaffoldBackgroundColor: colors.backgroundColor,
  appBarTheme: AppBarTheme(
      elevation: 0.5,
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      )),
  buttonTheme: ButtonThemeData(
      buttonColor: Colors.white, disabledColor: colors.primaryColorDark),
);

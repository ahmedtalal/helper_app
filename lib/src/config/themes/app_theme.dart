import 'package:flutter/material.dart';
import 'package:saied_app/src/core/utils/colors_app.dart';
import 'package:saied_app/src/core/utils/constants.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    fontFamily: Constants.fontApp,
    backgroundColor: ColorsApp.backgroundColor,
    scaffoldBackgroundColor: ColorsApp.backgroundColor,
  );

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    fontFamily: Constants.fontApp,
  );
}

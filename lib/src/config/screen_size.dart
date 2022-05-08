import 'package:flutter/material.dart';

class ScreenSizeConfig {
  static double fullWidthScreen(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double fullHeightScreen(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double setScreenHeight(BuildContext context, double height) =>
      fullHeightScreen(context) * height;

  static double setScreenwidth(BuildContext context, double width) =>
      fullWidthScreen(context) * width;
}

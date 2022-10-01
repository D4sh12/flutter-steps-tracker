import 'package:flutter/cupertino.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static Orientation? orientation;

  SizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

// Globally used
  static double get verticalSpace => screenWidth * 0.05;
  static double get screenPaddingX => screenWidth * 0.04;
  static double get screenPaddingY => screenHeight * 0.05;
  static double get screenMarginX => screenWidth * 0.1;
  static double get screenMarginY => screenHeight * 0.04;
  static double get borderRadius => screenWidth * 0.03;

  static double get btnWidth => screenWidth * 0.4;
  static double get btnHeight => screenWidth * 0.12;
}

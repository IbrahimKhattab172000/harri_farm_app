import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF88C653);
  static const Color secondary = Color(0xFFD0AA47);

  //---sections colors
  static const Color section1 = Color(0xFFF16868);
  static const Color section2 = Color(0xFFA3A9E3);
  static const Color section3 = Color(0xFFF1915A);
  static const Color section4 = Color(0xFF9DEA83);

  static const Color black = Color(0xFF061624);
  static const Color lightBlack = Color(0xFF3B3B3B);

  static const Color white = Color(0xffFEFCFF);

  static const Color lightGray = Color(0xFFCCCCCC);
  static const Color border = Color(0xFFEFEFEF);

  static const Color gray = Color(0xFF8B97A3);
  static const Color darkGray = Color(0xFF484848);
  static const Color lightPrimary = Color(0xFFE6DAEF);

  static const Color background = Color(0xffFEFEFE);
  static const Color green = Color(0xff9DEA83);
  static const Color blue = Color(0xff3B5998);
  static const Color red = Color(0xffE84900);
  static const Color yellow = Color(0xffF2C247);

  static const Gradient backgroundGradient = LinearGradient(
    begin: Alignment.topRight,
    colors: [
      AppColors.lightPrimary,
      AppColors.white,
    ],
  );
}

extension AppColorsTheme on Color {
  Color get theme {
    return this;
  }
}

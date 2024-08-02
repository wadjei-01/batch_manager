import 'package:bloc_test/utils/extensions/string.dart';
import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor get primaryColor =>
      getMaterialColor(Color('4484FF'.toHexString()));
  static Color get innerContainerColor => const Color(0xffF4F4FD);
  static Color get backgroundColor => Colors.white;
  static Color get lightGreen => const Color(0xffDFFFE7);
  static Color get lightGreyColor => const Color(0xffEAEAEA);
  static Color get greyColor => const Color(0xffB9B9C2);
  static Color get darkGreyColor => const Color(0xff7F7D8B);
  static Color get darkerGreyColor => const Color(0xff6B6B6B);
  static Color get black => const Color(0xff181818);

  static getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}

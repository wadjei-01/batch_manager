import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  // title
  static final title = lato(fontWeight: FontWeight.bold, fontSize: 18.sp);

  // Heading
  static final headingOne = lato(fontWeight: FontWeight.bold, fontSize: 16.sp);
  static final headingTwo = lato(fontWeight: FontWeight.w400, fontSize: 14.sp);

  // Body
  static final bodyOne = lato(fontSize: 16.sp);
  static final bodyTwo = lato(fontSize: 14.sp);
  static final small = lato(fontSize: 12.sp);
  static final xSmall = lato(fontSize: 10.sp);

  static TextStyle lato({
    TextStyle? textStyle,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    Color? color,
    Color? backgroundColor,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) {
    textStyle ??= const TextStyle();
    return textStyle.copyWith(
      fontFamily: 'Lato',
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
      backgroundColor: backgroundColor,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  static TextTheme latoTextTheme() {
    TextTheme textTheme = ThemeData.light().textTheme;
    return TextTheme(
      displayLarge: lato(textStyle: textTheme.displayLarge),
      displayMedium: lato(textStyle: textTheme.displayMedium),
      displaySmall: lato(textStyle: textTheme.displaySmall),
      headlineLarge: lato(textStyle: textTheme.headlineLarge),
      headlineMedium: lato(textStyle: textTheme.headlineMedium),
      headlineSmall: lato(textStyle: textTheme.headlineSmall),
      titleLarge: lato(textStyle: textTheme.titleLarge),
      titleMedium: lato(textStyle: textTheme.titleMedium),
      titleSmall: lato(textStyle: textTheme.titleSmall),
      bodyLarge: lato(textStyle: textTheme.bodyLarge),
      bodyMedium: lato(textStyle: textTheme.bodyMedium),
      bodySmall: lato(textStyle: textTheme.bodySmall),
      labelLarge: lato(textStyle: textTheme.labelLarge),
      labelMedium: lato(textStyle: textTheme.labelMedium),
      labelSmall: lato(textStyle: textTheme.labelSmall),
    );
  }
}

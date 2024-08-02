import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bloc_test/config/res/app_colors.dart';
import 'package:bloc_test/config/themes/text_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get darkTheme => ThemeData.dark().copyWith();

  static ThemeData get lightTheme => ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        dividerTheme: DividerThemeData(color: AppColors.greyColor),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white, elevation: 0),
        textTheme: AppTypography.latoTextTheme(),
        primarySwatch: AppColors.primaryColor,
        primaryColor: AppColors.primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.lightGreyColor,
          filled: true,
          hintStyle: AppTypography.bodyTwo.copyWith(
              color: AppColors.greyColor, fontWeight: FontWeight.w400),
          labelStyle:
              AppTypography.bodyTwo.copyWith(color: AppColors.primaryColor),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(15.r)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: AppColors.lightGreyColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGreyColor)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)),
                textStyle: WidgetStatePropertyAll(
                    AppTypography.bodyOne.copyWith(color: Colors.white)),
                elevation: const WidgetStatePropertyAll(0),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r))))),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          error: Colors.red,
        ),
        useMaterial3: true,
      );
}

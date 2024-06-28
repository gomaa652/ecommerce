import 'package:flutter/material.dart';
import 'package:yalla_client/core/utilities/configs/app_typography.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';

final themeLight = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: AllColors.blue,
  colorScheme: const ColorScheme.light(
    background: AllColors.white,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AllColors.blue,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: AllColors.white),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AllColors.white,
  appBarTheme: AppBarTheme(
      backgroundColor: AllColors.white,
      foregroundColor: AllColors.black,
      surfaceTintColor: AllColors.white,
      titleTextStyle: cm20,
      elevation: 0),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AllColors.blue,
    backgroundColor: AllColors.grayLight,
  ),
  hintColor: AllColors.grey,
  iconTheme: const IconThemeData(color: AllColors.white),
);

final themeDark = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: AllColors.black,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AllColors.blue,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: AllColors.black),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AllColors.black,
  appBarTheme: AppBarTheme(
      backgroundColor: AllColors.black,
      foregroundColor: AllColors.white,
      surfaceTintColor: AllColors.white,
      titleTextStyle: cm20.copyWith(color: Colors.white),
      elevation: 0),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AllColors.black,
    backgroundColor: AllColors.white,
  ),
  hintColor: AllColors.grey,
  iconTheme: const IconThemeData(color: AllColors.white),
);

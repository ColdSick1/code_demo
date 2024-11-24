import 'package:code_demonstration/gen/fonts.gen.dart';
import 'package:code_demonstration/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: FontFamily.inter,
  useMaterial3: true,
  colorScheme: const ColorScheme(
    background: AppColors.white,
    tertiary: AppColors.white,
    brightness: Brightness.light,
    primary: AppColors.green,
    onPrimary: AppColors.darkerGreen,
    secondary: AppColors.blueDark,
    onSecondary: AppColors.blueDark,
    surface: AppColors.greyLight,
    onSurface: AppColors.greyLight,
    error: AppColors.red,
    onError: AppColors.red,
    outline: AppColors.grey,
    tertiaryContainer: AppColors.greyDark,
    secondaryContainer: AppColors.yellow,
    onSurfaceVariant: AppColors.greyDark,
    inversePrimary: AppColors.black,
    onTertiary: AppColors.lightGreen,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      height: 1.2,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 1,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.2,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      height: 12 / 12,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      height: 1.2,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      height: 1,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
  ),
);

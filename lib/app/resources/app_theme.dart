import 'package:flutter/material.dart';
import 'package:kutulis_mo/app/resources/app_colors.dart';

@immutable
class AppTheme {
  const AppTheme._();

  // Theme
  static final light = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primary,
    focusColor: AppColors.primary,
    splashColor: AppColors.splash,
    dividerColor: AppColors.transparent,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.materialPrimary,
    ),
  );
}

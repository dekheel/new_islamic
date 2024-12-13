import 'package:flutter/material.dart';
import 'package:islami_app_new/core/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: AppColors.primaryDark));
}

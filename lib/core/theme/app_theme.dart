import 'package:evently_c13_online/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      dividerColor: AppColors.blue,
      primaryColor: AppColors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            color: AppColors.black, fontSize: 12, fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            color: AppColors.blue, fontSize: 22, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            color: AppColors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(
            color: AppColors.blue, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.blue,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.blue,
              textStyle: const TextStyle(
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: AppColors.gray,
          suffixIconColor: AppColors.gray,
          hintStyle: const TextStyle(
              fontSize: 16, color: AppColors.gray, fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.gray, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.gray, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.gray, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.red, width: 1),
          )));

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.dartPurple,
      dividerColor: AppColors.blue,
      dividerTheme: const DividerThemeData(
        color: AppColors.blue,
      ),
      primaryColor: AppColors.blue,
      textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.offWhite, fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          color: AppColors.offWhite, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: AppColors.offWhite, fontSize: 12, fontWeight: FontWeight.w500),
      labelLarge: TextStyle(
            color: AppColors.blue, fontSize: 22, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            color: AppColors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(
            color: AppColors.blue, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.dartPurple,
        foregroundColor: AppColors.blue,
        centerTitle: true,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
              foregroundColor: AppColors.blue,
              textStyle: const TextStyle(
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 20))),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.offWhite,
      suffixIconColor: AppColors.offWhite,
      hintStyle: const TextStyle(
          fontSize: 16, color: AppColors.offWhite, fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.blue, width: 1),
        ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.blue, width: 1),
        ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.blue, width: 1),
        ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.blue,
      )
  );
}

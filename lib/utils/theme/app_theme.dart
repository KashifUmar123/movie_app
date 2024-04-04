import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/utils/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
      primaryColor: whiteColor,
      brightness: Brightness.light,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 26.0,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: whiteColor,
      ));
}

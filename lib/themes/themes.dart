
import 'package:flutter/material.dart';
import 'package:medical_records/shared/constants/color_constants.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600
      ),
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      backgroundColor: Colors.grey.shade50,
      elevation: 0
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10)
      ),
      hintStyle: TextStyle(
        fontSize: 14,
      )
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.red
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        letterSpacing: -1.5,
        fontSize: 48,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      displayMedium: TextStyle(
        letterSpacing: -1.0,
        fontSize: 40,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
        letterSpacing: -1.0,
        fontSize: 32,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      headlineLarge: TextStyle(
        letterSpacing: -1.0,
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w600
      ),
      headlineMedium: TextStyle(
        letterSpacing: -1.0,
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),
      titleSmall: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 16,
        fontWeight: FontWeight.w400
      ),
      bodyLarge: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 14,
        fontWeight: FontWeight.w400
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600
      ),
      bodySmall: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 12,
        fontWeight: FontWeight.w400
      ),
      // overline: TextStyle(
      //   color: Colors.grey.shade700,
      //   fontSize: 10,
      //   fontWeight: FontWeight.w400,
      //   letterSpacing: -0.5
      // )
    )
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorConstants.gray900,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConstants.gray900,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white
      ),
    ),
    // bottomAppBarColor: ColorConstants.gray800,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10)
      ),
      hintStyle: TextStyle(
        fontSize: 14,
      )
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.white
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        letterSpacing: -1.5,
        fontSize: 48,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      displayMedium: TextStyle(
        letterSpacing: -1.0,
        fontSize: 40,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
        letterSpacing: -1.0,
        fontSize: 32,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      headlineLarge: TextStyle(
        letterSpacing: -1.0,
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w600
      ),
      headlineMedium: TextStyle(
        letterSpacing: -1.0,
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),
      titleSmall: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 16,
        fontWeight: FontWeight.w400
      ),
      bodyLarge: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 14,
        fontWeight: FontWeight.w400
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600
      ),
      bodySmall: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 12,
        fontWeight: FontWeight.w400
      ),
      // overline: TextStyle(
      //   color: Colors.grey.shade700,
      //   fontSize: 10,
      //   fontWeight: FontWeight.w400,
      //   letterSpacing: -0.5
      // )
    )
  );
}
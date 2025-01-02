import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme textTheme({required String fontFamily}) {
    TextStyle getStyle(double? size, FontWeight weight) {
      return GoogleFonts.getFont(fontFamily,
          fontSize: size, fontWeight: weight);
    }

    return TextTheme(
      headlineLarge: getStyle(24, FontWeight.w600), //---- heading
      headlineMedium: getStyle(20, FontWeight.w600), //--- heading2
      headlineSmall: getStyle(16, FontWeight.w500), //---- heading3
      bodyMedium: getStyle(15, FontWeight.w500), //------ body
      bodySmall: getStyle(13, FontWeight.w500), //------- body2
      labelSmall: getStyle(null, FontWeight.w400), //---- regular
      labelMedium: getStyle(null, FontWeight.w500), //--- medium
    );
  }
}

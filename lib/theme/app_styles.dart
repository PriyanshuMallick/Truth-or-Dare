import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle menuText = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w900,
  );
  static TextStyle get headLineStyle1 => GoogleFonts.pattaya(
        fontSize: 91,
        color: AppColors.textColor1,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get headLineStyle3 => GoogleFonts.pattaya(
        fontSize: 26,
        color: AppColors.textColor1,
        fontWeight: FontWeight.w400,
      );
}

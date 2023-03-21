import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle menuText = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle headLineStyle1 = TextStyle(
    fontFamily: 'Pattaya',
    fontSize: 91,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w400,
  );
  static TextStyle headLineStyle2 = GoogleFonts.pirataOne(
    // fontFamily: 'Pattaya',
    fontSize: 80,
    color: AppColors.textColor1,
    fontWeight: FontWeight.normal,
  );
  static TextStyle headLineStyle3 = GoogleFonts.pirataOne(
    // fontFamily: 'pirataOne',
    fontSize: 42.45,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w400,
  );
  static TextStyle headLineStyle4 = GoogleFonts.pirataOne(
    // fontFamily: 'pirataOne',
    fontSize: 26,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w400,
  );
  static TextStyle headLineStyle5 = GoogleFonts.pirataOne(
    // fontFamily: 'pirataOne',
    fontSize: 23,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w400,
  );
}

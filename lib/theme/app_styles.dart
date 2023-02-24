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
    fontFamily: "Pattaya",
    fontSize: 91,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle headLineStyle3 = TextStyle(
    fontFamily: "Pattaya",
    fontSize: 26,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w400,
  );
}

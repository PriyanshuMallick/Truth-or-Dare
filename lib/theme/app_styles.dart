import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:truthordare/theme/app_colors.dart';

class AppStyles {
  static TextStyle menuText = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle bigTitle = TextStyle(
    fontFamily: 'PirataOne',
    fontSize: 116,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle title = TextStyle(
    fontFamily: 'PirataOne',
    fontSize: 80,
    color: AppColors.textColor1,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: 'PirataOne',
    fontSize: 42.45,
    color: AppColors.textColor1,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle cardTitle_2 = TextStyle(
    fontFamily: 'PirataOne',
    fontSize: 35,
    color: AppColors.textColor1,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: 'PirataOne',
    fontSize: 26,
    color: AppColors.textColor1,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: 'PirataOne',
    fontSize: 23,
    color: AppColors.textColor1,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle scoreCardSubtitle = TextStyle(
    fontFamily: 'PirataOne',
    fontSize: 14,
    color: AppColors.textColor1,
    fontWeight: FontWeight.normal,
  );
}

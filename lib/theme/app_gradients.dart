import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  static const List<LinearGradient> dareCardBG = [
    LinearGradient(
      begin: FractionalOffset(0, 0),
      end: FractionalOffset(.7, .6),
      colors: AppColors.dareCard,
    )
  ];

  static const List<LinearGradient> truthCardBG = [
    LinearGradient(
      begin: FractionalOffset(0, 0),
      end: FractionalOffset(.75, .65),
      colors: AppColors.truthCard,
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: AppColors.truthCard,
    ),
  ];
}

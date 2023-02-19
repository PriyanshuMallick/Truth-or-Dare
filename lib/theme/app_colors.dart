import 'package:flutter/material.dart';

int theme_ = 2;

class AppColors {
  //? ------------------------- BG Color -------------------------
  // static const Color _bgColor1 = Color(0xFF021827); // Dark Blue
  // Method
  // static Color bgColor() => _bgColor1;
  // static Color bgColor() => Colors.black;
  static Color get bgColor => Colors.white70;

  //? -------------------- Selected Option BG Color --------------------

  static Color get truthBG => const Color(0xff2196F3);
  static Color get dareBG => const Color(0xffe85a5a);

  //? -------------------- Text Color --------------------
  static const Color textColor1 = Colors.white;
  static const Color textColor0 = Colors.black;
}

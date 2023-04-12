import 'package:flutter/material.dart';

class AppColors {
  static int theme_ = 2;
  //? ------------------------- BG Color -------------------------
  // static const Color _bgColor1 = Color(0xFF021827); // Dark Blue
  // Method
  // static Color bgColor() => _bgColor1;
  // static Color bgColor() => Colors.black;
  static Color get bgColor => Colors.white70;

  //? -------------------- Selected Option BG Color --------------------

  static Color get truthBG => darkBlue;
  static Color get dareBG => darkRed;
  static Color get dareText => const Color(0xffF17373);
  static Color get truthText => const Color(0xff9CD0EC);
  static Color get dareButton => const Color(0xff913031);
  static Color get truthButton => const Color(0xff2B6A8C);

  static const Color lightBlue1 = Color(0xff5ec6fe);
  static const Color lightBlue2 = Color(0xff57adfc);
  static const Color blue1 = Color(0xff218ffc);
  static const Color blue2 = Color(0xff0d67f7);
  static const Color blue3 = Color(0xff0a3e98);
  static const Color darkerBlue = Color(0xff161b29);
  static const Color grey = Color(0xff525252);
  static const Color red = Color(0xffe22021);
  static const Color white = Color(0xfff2f4f6);
  static const Color peach = Color(0xfff47f80);
  static const Color peach2 = Color(0xfff25b5c);

  // New
  static Color get homeScreenIcon => lightPurple;
  static Color get homeScreenBottomNavBorder => const Color(0xff5C4117);

  static const Color darkRed = Color(0xff4E1D1E);
  static const Color darkerRed = Color(0xff500506);
  static const Color darkBlue = Color(0xff1E4052);
  static const Color darkerPurple = Color(0xff190528);
  static const Color darkPurple = Color(0xff4D1C69);
  static const Color purple = Color(0xff3E1257);
  static const Color lightPurple = Color(0xffA635FF);
  static const Color lighterPurple = Color(0xffC86DFF);

  // List
  static const List<Color> homeScreen = [
    darkerPurple,
    darkPurple,
    darkerRed,
  ];
  static const List<Color> dareCard = [
    Color(0xffFF9292),
    Color(0xffD94242),
  ];
  static const List<Color> truthCard = [
    Color(0xffABE2FF),
    Color(0xff1B709D),
  ];

  //? -------------------- Text Color --------------------
  static const Color textColor1 = Colors.white;
  static const Color textColor0 = Colors.black;
}

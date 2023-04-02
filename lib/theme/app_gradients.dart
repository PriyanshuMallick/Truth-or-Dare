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
  static const List<LinearGradient> purpleCardBG = [
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA635FF),
        Color(0xFF3E1257),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA635FF),
        Color(0xFF932EDC),
        Color(0xFF3E1257),
      ],
    ),
  ];

  static const List<LinearGradient> bottomNavBG = [
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.center,
      colors: [
        Color(0xff1F0000),
        Color(0xff190823),
      ],
    ),
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Color(0xff2B0D35),
      ],
    ),
  ];

  static const List<LinearGradient> playerInfoBG = [
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0x4BA635FF),
        Color(0x4B932EDC),
        Color(0x4B3E1257),
      ],
    ),
    LinearGradient(
      begin: Alignment.center,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Color(0xff16041C),
      ],
    ),
  ];

  static const List<LinearGradient> mainScreenBG = [
    homeScreen,
    transparent2Black,
  ];

  static const LinearGradient homeScreen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: AppColors.homeScreen,
  );

  static const LinearGradient transparent2Black = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color.fromARGB(255, 14, 0, 24),
    ],
  );
}

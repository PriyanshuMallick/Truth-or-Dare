import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:truthordare/module/screen_navs.dart';
import 'package:truthordare/screens/game/game_screen.dart';
import 'package:truthordare/screens/pre_game/player_details_screen.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/text/incremental_text.dart';

List<ScreenNavs> bottomNavsList = [
  ScreenNavs(
    title: 'Navigation',
    icon: FontAwesomeIcons.compass,
    screen: getTestScreen(title: 'Navigation'),
  ),
  ScreenNavs(
    title: 'Home',
    icon: FontAwesomeIcons.house,
    screen: const GameScreen(),
  ),
  ScreenNavs(
    title: 'Profile',
    icon: FontAwesomeIcons.userNinja,
    screen: const PlayerDetailsScreen(),
    // screen: getTestScreen('Profile'),
  )
];

Widget getTestScreen({String title = ''}) {
  return Center(
    child: IncrementalText(
      text: '$title\nComing Soon...',
      style: AppStyles.headLineStyle3,
      textAlign: TextAlign.left,
    ),
  );
}

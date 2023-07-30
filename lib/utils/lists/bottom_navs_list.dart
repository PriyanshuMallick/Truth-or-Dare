import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:truthordare/module/screen_nav.dart';
import 'package:truthordare/screens/game/game_screen.dart';
import 'package:truthordare/screens/pre_game/scoreboard_screen.dart';
import 'package:truthordare/screens/pre_game/player_details_screen.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/text/incremental_text.dart';

List<ScreenNav> bottomNavsList = [
  ScreenNav(
    title: 'ScoreBoard',
    icon: FontAwesomeIcons.compass,
    screen: const ScoreBoardScreen(),
  ),
  ScreenNav(
    title: 'Play',
    icon: FontAwesomeIcons.gamepad,
    screen: const GameScreen(),
  ),
  ScreenNav(
    title: 'Players',
    icon: FontAwesomeIcons.userNinja,
    screen: const PlayerDetailsScreen(),
  ),
  ScreenNav(
    title: 'Settings',
    icon: FontAwesomeIcons.gear,
    screen: getTestScreen(title: 'Settings'),
  ),
];

Widget getTestScreen({String title = ''}) {
  return Center(
    child: IncrementalText(
      text: '$title\nComing Soon...',
      style: AppStyles.cardTitle,
      textAlign: TextAlign.left,
    ),
  );
}

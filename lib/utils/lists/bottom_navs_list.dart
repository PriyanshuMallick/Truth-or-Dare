import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../module/screen_navs.dart';
import '../../screens/pre_game/home_screen.dart';
import '../../screens/pre_game/player_details_screen.dart';
import '../../theme/app_styles.dart';
import '../../widgets/stylish/incremental_text.dart';

List<ScreenNavs> bottomNavsList = [
  ScreenNavs(
    title: 'Navigation',
    icon: FontAwesomeIcons.compass,
    screen: getTestScreen(title: 'Navigation'),
  ),
  ScreenNavs(
    title: 'Home',
    icon: FontAwesomeIcons.house,
    screen: const HomeScreen(),
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

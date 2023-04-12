import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:truthordare/providers/screen_provider.dart';
import 'package:truthordare/utils/lists/bottom_navs_list.dart';
import 'package:truthordare/widgets/nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  final _sProvider = Provider.of<ScreenProvider>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: bottomNavsList[_sProvider(context).selectedScreenIndex].screen,
      bottomNavigationBar: NavBar(
        navList: bottomNavsList,
        onTap: (index) => _sProvider(context, listen: false).changeBottomNavScreen(index),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:truthordare/module/screen_nav.dart';

import 'package:truthordare/providers/screen_provider.dart';
import 'package:truthordare/settings/players_info.dart';
import 'package:truthordare/theme/app_colors.dart';
import 'package:truthordare/theme/app_consts.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/utils/lists/bottom_navs_list.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  final _sProvider = Provider.of<ScreenProvider>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: bottomNavsList[_sProvider(context).selectedScreenIndex].screen,
      // bottomNavigationBar: NavBar(
      //   navList: bottomNavsList,
      //   onTap: (index) => _sProvider(context, listen: false).changeBottomNavScreen(index),
      // ),

      bottomNavigationBar: GradientStack(
        gradients: AppGradients.bottomNavBG,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 1,
                width: AppConsts.screenWidth,
                color: AppColors.homeScreenBottomNavBorder,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  gap: 20,
                  iconSize: 24,
                  color: AppColors.homeScreenIcon,
                  activeColor: AppColors.homeScreenIcon,
                  hoverColor: Colors.deepPurple.withOpacity(.2),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  // duration: const Duration(milliseconds: 400),

                  //
                  tabs: [
                    ...getNavButtons(),
                  ],

                  //
                  selectedIndex: _sProvider(context).selectedScreenIndex,
                  onTabChange: (index) {
                    _sProvider(context, listen: false).changeBottomNavScreen(index);
                    PlayersInfo.randomPlayer;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<GButton> getNavButtons() {
  List<GButton> list = [];

  for (ScreenNav nav in bottomNavsList) {
    list.add(
      GButton(
        text: nav.title,
        icon: nav.icon,
      ),
    );
  }

  return list;
}

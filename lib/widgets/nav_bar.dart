import 'package:flutter/material.dart';
import 'package:truthordare/module/screen_nav.dart';

import '../theme/app_colors.dart';
import '../theme/app_consts.dart';
import '../theme/app_gradients.dart';
import '../utils/app_layout.dart';
import 'stylish/gradient_stack.dart';

class NavBar extends StatelessWidget {
  final List<ScreenNav> navList;
  final double? width;
  final double height;
  final double iconSize;
  final Function(int index) onTap;
  const NavBar({
    super.key,
    required this.navList,
    this.width,
    this.height = 66,
    this.iconSize = 22,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GradientStack(
      gradients: AppGradients.bottomNavBG,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            width: AppConsts.screenWidth,
            color: AppColors.homeScreenBottomNavBorder,
          ),
          Row(
            children: getBottomNavs(
              context,
              navList,
              width: (width == null ? AppConsts.screenWidth : width!) / navList.length,
              height: AppLayout.getHeight(height),
              iconSize: iconSize,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getBottomNavs(
    BuildContext context,
    List<ScreenNav> navList, {
    required double width,
    required double height,
    required double iconSize,
  }) {
    List<Widget> list = [];
    for (var i = 0; i < navList.length; i++) {
      list.add(
        GestureDetector(
          onTap: () => onTap(i),
          child: SizedBox(
            // color: Colors.transparent,
            height: height,
            width: width,
            child: Icon(
              navList[i].icon,
              color: AppColors.homeScreenIcon,
              size: iconSize,
              semanticLabel: navList[i].title,
            ),
          ),
        ),
      );
    }

    return list;
  }
}

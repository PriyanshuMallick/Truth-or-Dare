import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truthordare/module/lists/bottom_navs_list.dart';
import 'package:truthordare/theme/app_colors.dart';
import 'package:truthordare/theme/app_consts.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/utils/app_layout.dart';
import 'package:truthordare/widgets/fat_buttons.dart';
import 'package:truthordare/widgets/gradient_stack.dart';

import '../module/question_provider.dart';
import 'question_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientStack(
      gradients: const [
        AppGradients.homeScreen,
        AppGradients.transparent2Black,
      ],
      child: Scaffold(
        bottomNavigationBar: getBottomNavBar(),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'TRUTH\nOR\nDARE',
              textAlign: TextAlign.center,
              style: AppStyles.headLineStyle1,
            ),

            //? Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FatButton(
                  text: 'Truth',
                  //   bgColor: AppColors.truthBG,
                  bgColor: AppColors.purple,
                  onTap: () {
                    Provider.of<QuestionProvider>(context, listen: false).updateQuestion(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionScreen(isTruth: true),
                      ),
                    );
                  },
                ),
                FatButton(
                  text: 'Dare',
                  //   bgColor: AppColors.dareBG,
                  bgColor: AppColors.purple,
                  onTap: () {
                    Provider.of<QuestionProvider>(context, listen: false).updateQuestion(false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionScreen(isTruth: false),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomNavBar() {
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
                bottomNavsList,
                width: AppConsts.screenWidth / bottomNavsList.length,
                height: AppLayout.getHeight(60),
                iconSize: 22,
              ),
            ),
          ],
        ));
  }

  List<Widget> getBottomNavs(List navList, {required double width, required double height, required double iconSize}) {
    List<Widget> list = [];
    for (var i = 0; i < navList.length; i++) {
      list.add(
        GestureDetector(
          onTap: () => navList[i]['onTap'](),
          child: SizedBox(
            // color: Colors.transparent,
            height: height,
            width: width,
            child: Icon(
              navList[i]['icon'],
              color: AppColors.homeScreenIcon,
              size: iconSize,
            ),
          ),
        ),
      );
    }
    return list;
  }
}

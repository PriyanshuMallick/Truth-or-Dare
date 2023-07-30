import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:truthordare/screens/bottom_nav_bar.dart';
import 'package:truthordare/screens/game/game_screen.dart';
import 'package:truthordare/settings/game_settings.dart';
import 'package:truthordare/settings/players_info.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/buttons/fat_buttons.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientStack(
        gradients: AppGradients.mainScreenBG,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 60, bottom: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Truth\nor\nDare'.toUpperCase(),
                    style: AppStyles.bigTitle,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: Container()),

                  //? --------------------------------- Game Mode Button ---------------------------------
                  FatButton(
                    text: 'Game Mode',
                    width: 280,
                    // width: AppConsts.inputButtonWidth,
                    gradient: AppGradients.inputFeild,
                    onTap: () {
                      GameSettings.isGameMode = true;
                      PlayersInfo.resetPlayersScore();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BottomNavBar()),
                      );
                    },
                  ),

                  const Gap(35),

                  //? ------------------------------- Question Only Button -------------------------------
                  FatButton(
                    text: 'Question Only',
                    width: 280,
                    // width: AppConsts.inputButtonWidth,
                    gradient: AppGradients.inputFeild,
                    onTap: () {
                      GameSettings.isGameMode = false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GameScreen()),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

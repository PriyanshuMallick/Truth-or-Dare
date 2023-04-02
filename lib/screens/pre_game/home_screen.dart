import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings/players_info.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_styles.dart';
import '../../utils/question_provider.dart';
import '../../widgets/buttons/fat_buttons.dart';
import '../../widgets/cards/game_card.dart';
import '../../widgets/stylish/Changing_text.dart';
import '../../widgets/stylish/gradient_stack.dart';
import '../question_screen.dart';

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
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GameCard(
              title: 'Choose',
              gradient: AppGradients.purpleCardBG,
              onTap: () => print('Tapped'),
              child: Column(
                children: [
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 1.5,
                      sigmaY: 1.5,
                    ),
                    child: ChangingText(
                      text: '',
                      changingText: () => PlayersInfo.getRandomPlayer().name,
                      style: AppStyles.headLineStyle4.copyWith(color: const Color.fromRGBO(255, 255, 255, .2)),
                    ),
                  ),
                  ChangingText(
                    text: PlayersInfo.getRandomPlayer().name,
                    changingText: () => PlayersInfo.getRandomPlayer().name,
                  ),
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 1.5,
                      sigmaY: 1.5,
                    ),
                    child: ChangingText(
                      text: '',
                      changingText: () => PlayersInfo.getRandomPlayer().name,
                      style: AppStyles.headLineStyle4.copyWith(color: const Color.fromRGBO(255, 255, 255, .2)),
                    ),
                  ),
                ],
              ),
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
}

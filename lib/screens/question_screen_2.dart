import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:truthordare/widgets/repeating_bg.dart';

import '../module/questions.dart';
import '../theme/app_colors.dart';
import '../theme/app_consts.dart';
import '../theme/app_gradients.dart';
import '../theme/app_styles.dart';
import '../widgets/fat_buttons_2.dart';
import '../widgets/game_card.dart';

class QuestionScreen extends StatelessWidget {
  final bool isTruth;
  const QuestionScreen({super.key, required this.isTruth});

  @override
  Widget build(BuildContext context) {
    Random rand = Random();
    int index = rand.nextInt(Questions.length);
    return Scaffold(
      backgroundColor: isTruth ? AppColors.truthBG : AppColors.dareBG,
      body: Stack(
        children: [
          RotatedPattern(
            column: 5,
            row: 6,
            gap: 40,
            degree: -17,
            scale: 3.5,
            widget: Text(
              isTruth ? '?' : '!',
              style: AppStyles.headLineStyle2.copyWith(
                fontSize: 50,
                color: const Color.fromARGB(8, 255, 255, 255),
              ),
            ),
          ),
          Container(
            height: AppConsts.screenHeight,
            width: AppConsts.screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color.fromARGB(70, 0, 0, 0),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isTruth ? 'TRUTH' : 'DARE',
                  style: AppStyles.headLineStyle2.copyWith(
                    color: isTruth ? AppColors.truthText : AppColors.dareText,
                  ),
                ),
                const Gap(20),
                GameCard(
                  title: 'Eve',
                  subTitle: isTruth ? Questions.truth[index] : Questions.dare[index],
                  gradient: isTruth ? AppGradients.truthCardBG : AppGradients.dareCardBG,
                ),
                const Gap(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FatButton(
                      text: 'COMPLETED',
                      color: isTruth ? AppColors.truthButton : AppColors.dareButton,
                      onTap: () {},
                    ),
                    const Gap(15),
                    FatButton(
                      text: 'FORFEIT',
                      color: isTruth ? AppColors.truthButton : AppColors.dareButton,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

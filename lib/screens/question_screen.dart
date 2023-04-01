import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:truthordare/utils/question_provider.dart';
import 'package:truthordare/widgets/stylish/rotated_pattern.dart';

import '../theme/app_colors.dart';
import '../theme/app_consts.dart';
import '../theme/app_gradients.dart';
import '../theme/app_styles.dart';
import '../widgets/buttons/fat_buttons.dart';
import '../widgets/cards/game_card.dart';

class QuestionScreen extends StatelessWidget {
  final _qProvider = Provider.of<QuestionProvider>;
  final bool isTruth;
  const QuestionScreen({super.key, required this.isTruth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTruth ? AppColors.truthBG : AppColors.dareBG,
      body: Stack(
        children: [
          //? --------------------------------- Background Pattern ---------------------------------
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

          //? ---------------------------------------- Main ----------------------------------------
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
                //? ----------------------------------- Heading -----------------------------------
                Text(
                  isTruth ? 'TRUTH' : 'DARE',
                  style: AppStyles.headLineStyle2.copyWith(
                    color: isTruth ? AppColors.truthText : AppColors.dareText,
                  ),
                ),
                const Gap(20),

                //? ------------------------------------ Cards ------------------------------------
                GameCard(
                  title: 'Eve',
                  subTitle: () => _qProvider(context).currentQuestion,
                  onTap: () => _qProvider(context, listen: false).updateQuestion(isTruth),
                  gradient: isTruth ? AppGradients.truthCardBG : AppGradients.dareCardBG,
                ),

                //? ----------------------------------- Buttons -----------------------------------
                const Gap(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FatButton(
                      text: 'COMPLETED',
                      bgColor: isTruth ? AppColors.truthButton : AppColors.dareButton,
                      onTap: () => Navigator.pop(context),
                    ),
                    const Gap(15),
                    FatButton(
                      text: 'FORFEIT',
                      bgColor: isTruth ? AppColors.truthButton : AppColors.dareButton,
                      onTap: () => _qProvider(context, listen: false).updateQuestion(isTruth),
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

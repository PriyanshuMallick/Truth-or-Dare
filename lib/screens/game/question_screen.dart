import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:truthordare/providers/question_provider.dart';
import 'package:truthordare/settings/players_info.dart';
import 'package:truthordare/theme/app_colors.dart';
import 'package:truthordare/theme/app_consts.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/buttons/fat_buttons.dart';
import 'package:truthordare/widgets/cards/game_card.dart';
import 'package:truthordare/widgets/text/incremental_text.dart';
import 'package:truthordare/widgets/stylish/rotated_pattern.dart';

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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Gap(20),
                Expanded(child: Container()),

                //? ----------------------------------- Heading -----------------------------------
                Text(
                  // PlayersInfo.currentPlayer.name,
                  isTruth ? 'Truth' : 'DARE',
                  style: AppStyles.headLineStyle2.copyWith(
                    color: isTruth ? AppColors.truthText : AppColors.dareText,
                  ),
                  textAlign: TextAlign.center,
                ),

                Expanded(child: Container()),

                //? ------------------------------------ Cards ------------------------------------
                GameCard(
                  title: PlayersInfo.currentPlayer.name,
                  // title: isTruth ? 'Truth' : 'DARE',
                  onTap: () => _qProvider(context, listen: false).updateQuestion(isTruth: isTruth),
                  gradient: isTruth ? AppGradients.truthCardBG : AppGradients.dareCardBG,
                  child: IncrementalText(text: _qProvider(context).currentQuestion),
                ),

                Expanded(child: Container()),
                //? ----------------------------------- Buttons -----------------------------------

                Expanded(child: Container()),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //? ------------------------------ COMPLETED Buttons-------------------------------
                    FatButton(
                      text: 'COMPLETED',
                      bgColor: isTruth ? AppColors.truthButton : AppColors.dareButton,
                      onTap: () => Navigator.pop(context),
                    ),
                    const Gap(15),
                    //? ------------------------------- FORFEIT Buttons -------------------------------
                    FatButton(
                      text: 'FORFEIT',
                      bgColor: isTruth ? AppColors.truthButton : AppColors.dareButton,
                      onTap: () => _qProvider(context, listen: false).updateQuestion(isTruth: isTruth),
                    ),
                  ],
                ),

                const Gap(50),
                Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

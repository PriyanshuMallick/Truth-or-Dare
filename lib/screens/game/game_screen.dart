import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:truthordare/screens/game/question_screen.dart';
import 'package:truthordare/settings/game_settings.dart';
import 'package:truthordare/settings/players_info.dart';
import 'package:truthordare/theme/app_colors.dart';
import 'package:truthordare/theme/app_consts.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/utils/app_layout.dart';
import 'package:truthordare/providers/player_provider.dart';
import 'package:truthordare/providers/question_provider.dart';
import 'package:truthordare/widgets/buttons/fat_buttons.dart';
import 'package:truthordare/widgets/cards/game_card.dart';
import 'package:truthordare/widgets/stylish/Changing_text.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';
import 'package:truthordare/widgets/stylish/incremental_text.dart';

int testInt = 0;

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  final _pProvider = Provider.of<PlayerProvider>;
  @override
  Widget build(BuildContext context) {
    return GradientStack(
      gradients: const [
        AppGradients.homeScreen,
        AppGradients.transparent2Black,
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GameCard(
                titleWidget: ChangingText(
                  // isBlur: false,
                  text: _pProvider(context).currentPlayer.name,
                  duration: Duration(milliseconds: GameSettings.randomizationTimeInMilisec),
                  changingText: () {
                    if (GameSettings.canGoToQuestionScreen) {
                      GameSettings.canGoToQuestionScreen = false;

                      Future.delayed(
                        Duration(milliseconds: GameSettings.randomizationTimeInMilisec + 1000),
                        () => GameSettings.canGoToQuestionScreen = true,
                      );
                    }

                    return PlayersInfo.pseudoRandomPlayer.name;
                  },
                ),
                gradient: AppGradients.purpleCardBG,
                onTap: () => _pProvider(context).updatePlayer(),
                child: FutureBuilder(
                  future: Future.delayed(Duration(
                    milliseconds: GameSettings.randomizationTimeInMilisec + 100,
                  )),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox();
                    } else {
                      return const IncrementalText(
                        text: 'Will you reveal the truth or take on a dare? The choice is yours!',
                      );
                    }
                  },
                ),
              ),
              const Gap(40),

              //? ------------------------------------- Buttons -------------------------------------
              SizedBox(
                width: AppConsts.cardWidth,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FatButton(
                          text: 'Truth',
                          bgColor: AppColors.purple,
                          onTap: () {
                            Provider.of<QuestionProvider>(context, listen: false).updateQuestion(true);
                            if (GameSettings.canGoToQuestionScreen) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuestionScreen(isTruth: true),
                                ),
                              );
                            }
                          },
                        ),
                        FatButton(
                          text: 'Dare',
                          bgColor: AppColors.purple,
                          onTap: () {
                            Provider.of<QuestionProvider>(context, listen: false).updateQuestion(false);
                            if (GameSettings.canGoToQuestionScreen) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuestionScreen(isTruth: false),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(7)),

                    //? ------------------------------- Random Buttom -------------------------------
                    FatButton(
                      width: double.maxFinite,
                      text: 'Random',
                      bgColor: AppColors.purple,
                      onTap: () => _pProvider(context, listen: false).updatePlayer(),
                    )
                  ],
                ),
              ),

              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}

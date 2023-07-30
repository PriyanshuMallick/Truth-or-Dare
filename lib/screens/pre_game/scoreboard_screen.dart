import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:truthordare/module/player.dart';
import 'package:truthordare/settings/players_info.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/cards/score_card.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';

class ScoreBoardScreen extends StatelessWidget {
  const ScoreBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientStack(
      gradients: const [
        AppGradients.homeScreen,
        AppGradients.transparent2Black,
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox.expand(
            child: ListView(
              // shrinkWrap: true,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 100),
                    child: Text(
                      'ScoreBoard'.toUpperCase(),
                      style: AppStyles.cardTitle,
                    ),
                  ),
                ),
                Column(
                  children: [
                    ...getScoresCards(),
                  ],
                ),

                //
                const Gap(100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScoresCards() {
    List<Widget> list = [];

    for (Player player in PlayersInfo.players) {
      list.add(
        ScoreCard(player: player),
      );

      list.add(
        const Gap(24),
      );
    }

    return list;
  }
}

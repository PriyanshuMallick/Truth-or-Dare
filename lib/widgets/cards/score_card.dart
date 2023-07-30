import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:truthordare/module/player.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/cards/my_card.dart';

class ScoreCard extends StatelessWidget {
  final Player player;

  const ScoreCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      gradients: [AppGradients.purpleCardBG[1]],
      cardHeight: 105,
      cardWidth: 320,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: .5, horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //? --------------------------------------- Name & Score ---------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? ----------------------------------------- Name -----------------------------------------
                  Text(
                    player.name,
                    style: AppStyles.cardSubtitle,
                  ),

                  //? ------------------------------ Completed & Forfeit Score ------------------------------
                  Row(
                    children: [
                      //
                      Text(
                        'Forfeit   ${player.totalForfeited}',
                        style: AppStyles.scoreCardSubtitle,
                      ),
                      //
                      const Gap(30),
                      //
                      Text(
                        'Completed   ${player.totalCompleted}',
                        style: AppStyles.scoreCardSubtitle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            //? ------------------------------------------ Score ------------------------------------------
            Text(
              player.score.toString(),
              style: AppStyles.title,
            ),
          ],
        ),
      ),
    );
  }
}

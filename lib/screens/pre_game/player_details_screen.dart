import 'package:flutter/material.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/utils/app_layout.dart';
import 'package:truthordare/utils/lists/bottom_navs_list.dart';
import 'package:truthordare/widgets/cards/stacked_cards.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';

class PlayerDetailsScreen extends StatelessWidget {
  const PlayerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientStack(
      gradients: AppGradients.mainScreenBG,
      child: Center(
        child: StackedCards(
          repeat: 3,
          cardHeight: AppLayout.getHeightPercent(73),
          cardWidth: AppLayout.getWidth(600),
          gap: 0,
          scaleFactor: 0.1,
          darken: false,
          gradients: const [AppGradients.playerInfoBG],
          child: getTestScreen(title: 'Profile'),
        ),
      ),
    );
  }
}

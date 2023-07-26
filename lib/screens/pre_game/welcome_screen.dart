import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:truthordare/screens/bottom_nav_bar.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';

import '../../utils/app_layout.dart';
import '../../widgets/cards/stacked_cards.dart';
import '../../widgets/text/incremental_text.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientStack(
      gradients: AppGradients.mainScreenBG,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ),
          ),
          child: SizedBox.expand(
            child: Center(
              child: StackedCards(
                repeat: 3,
                cardHeight: AppLayout.getHeightPercent(73),
                cardWidth: AppLayout.getWidth(600),
                gap: 0,
                scaleFactor: 0.1,
                darken: false,
                gradients: const [AppGradients.playerInfoBG2],
                child: Column(
                  children: [
                    const Gap(30),
                    const IncrementalText(
                      text: 'Welcome',
                      style: AppStyles.headLineStyle3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: FutureBuilder(
                        future: Future.delayed(const Duration(milliseconds: 100)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const SizedBox();
                          } else {
                            return const IncrementalText(
                              text: 'Get ready to push your boundaries with a game of truth or dare!\n\nTap to begin!',
                            );
                          }
                        },
                      ),
                    ),
                    const Gap(150),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

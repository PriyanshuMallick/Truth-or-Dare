import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../theme/app_consts.dart';
import '../../theme/app_styles.dart';
import '../../utils/app_layout.dart';
import 'stacked_cards.dart';

class GameCard extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? child;
  final Function? onTap;
  final List<Gradient> gradient;
  final double gap;
  final bool center;

  const GameCard({
    super.key,
    this.title,
    this.titleWidget,
    this.child,
    required this.gradient,
    this.onTap,
    this.gap = 100,
    this.center = false,
  });

  @override
  Widget build(BuildContext context) {
    return StackedCards(
      // onTap: () => onTap(),
      repeat: 3,
      gradients: [gradient],
      child: Column(
        children: [
          Gap(AppLayout.getHeight(20)),

          //? Title Text
          if (title != null)
            Text(
              title ?? '',
              style: AppStyles.headLineStyle3,
            ),

          //? Title Widget
          if (titleWidget != null) titleWidget!,

          //? <HR>
          Gap(AppLayout.getHeight(5)),
          Container(
            height: 1,
            width: AppConsts.cardWidth * .85,
            color: Colors.white,
          ),

          //? Body
          if (!center) Gap(AppLayout.getHeight(gap)),
          if (center) Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.cardWidth * .1),
            child: child,
          ),
          if (center) Expanded(child: Container()),
        ],
      ),
    );
  }
}

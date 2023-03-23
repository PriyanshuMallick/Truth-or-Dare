// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme/app_consts.dart';
import '../theme/app_styles.dart';
import '../utils/app_layout.dart';
import '../widgets/incremental_text.dart';
import 'cards/stacked_cards.dart';

class GameCard extends StatelessWidget {
  final String title;
  final Function subTitle;
  final Function onTap;
  final List<Gradient> gradient;

  const GameCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return StackedCards(
      // onTap: () => onTap(),
      repeat: 3,
      gradient: gradient,
      child: Column(
        children: [
          Gap(AppLayout.getHeight(20)),
          Text(
            title,
            style: AppStyles.headLineStyle3,
          ),
          Gap(AppLayout.getHeight(5)),
          Container(
            height: 1,
            width: AppConsts.cardWidth * .85,
            color: Colors.white,
          ),
          Gap(AppLayout.getHeight(100)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConsts.cardWidth * .1),
            child: IncrementalText(text: subTitle()),
          )
        ],
      ),
    );
  }
}

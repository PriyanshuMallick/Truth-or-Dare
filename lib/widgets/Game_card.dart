import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:truthordare/theme/app_consts.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/utils/app_layout.dart';
import 'package:truthordare/widgets/incremental_text.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Gradient> gradient;

  const GameCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return _Card(
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
          // Expanded(child: Container()),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConsts.cardWidth * .1),
            child: IncrementalText(text: subTitle),
          )
          // Expanded(child: Container()),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  final int repeat;
  final List<Gradient> gradient;
  // ignore: unused_element
  const _Card({required this.gradient, required this.child, this.repeat = 1});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: getCards(repeat),
    );
  }

  List<Widget> getCards(int count) {
    List<Widget> cards = [];
    const double scaleFactor = .11;
    const double opacityFactor = .2;
    const double gap = 445 / (scaleFactor * 100) - 30;

    for (int i = 0; i < count; i++) {
      cards.add(
        Padding(
          padding: EdgeInsets.only(top: gap * i),
          // padding: const EdgeInsets.only(top: 0),
          child: Transform.scale(
            alignment: Alignment.topCenter,
            scale: 1 - scaleFactor * (repeat - i - 1),
            child: Container(
              height: AppConsts.cardHeight,
              width: AppConsts.cardWidth,
              decoration: BoxDecoration(
                gradient: gradient[i < gradient.length ? i : gradient.length - 1],
                borderRadius: BorderRadius.circular(14),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                color: Colors.black.withOpacity(opacityFactor * (repeat - i - 1)),
                child: i == count - 1 ? child : null,
              ),
            ),
          ),
        ),
      );
    }

    return cards;
  }
}

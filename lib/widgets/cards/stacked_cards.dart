import 'package:flutter/material.dart';

import 'my_card.dart';

class StackedCards extends StatelessWidget {
  final int repeat;
  final Widget child;
  final Color? color;
  final List<List<Gradient>> gradients;
  final double? cardHeight;
  final double? cardWidth;
  final double gap;
  final bool darken;
  final List<BoxShadow>? boxShadow;

  final double scaleFactor;
  final double opacityFactor;

  const StackedCards({
    super.key,
    required this.child,
    required this.gradients,
    this.repeat = 1,
    this.scaleFactor = .11,
    this.opacityFactor = .2,
    this.color,
    this.cardHeight,
    this.cardWidth,
    this.gap = 0,
    this.darken = true,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: getCards(repeat),
    );
  }

  double get calculatedGap => (445 / (scaleFactor * 100) - 30 + gap).abs();

  List<Widget> getCards(int count) {
    List<Widget> cards = [];
    final double gap = calculatedGap;

    for (int i = 0; i < count; i++) {
      cards.add(
        Padding(
          padding: EdgeInsets.only(top: gap * i),
          child: Transform.scale(
            scale: 1 - scaleFactor * (repeat - i - 1),
            alignment: Alignment.topCenter,
            child: MyCard(
              boxShadow: boxShadow,
              gradients: gradients[i < gradients.length ? i : gradients.length - 1],
              color: i != count - 1 && darken ? Colors.black.withOpacity(opacityFactor * (count - i - 1)) : null,
              cardHeight: cardHeight,
              cardWidth: cardWidth,
              child: i == count - 1 ? child : null,
            ),
          ),
        ),
      );
    }
    return cards;
  }
}

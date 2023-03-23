import 'package:flutter/material.dart';

import 'my_card.dart';

class StackedCards extends StatelessWidget {
  final int repeat;
  final Widget child;
  final Color? color;
  final List<Gradient> gradient;

  final double scaleFactor;
  final double opacityFactor;

  const StackedCards({
    super.key,
    required this.child,
    required this.gradient,
    this.repeat = 1,
    this.scaleFactor = .11,
    this.opacityFactor = .2,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: getCards(repeat),
    );
  }

  List<Widget> getCards(int count) {
    List<Widget> cards = [];
    final double gap = 445 / (scaleFactor * 100) - 30;

    for (int i = 0; i < count; i++) {
      cards.add(
        Padding(
          padding: EdgeInsets.only(top: gap * i),
          child: Transform.scale(
            scale: 1 - scaleFactor * (repeat - i - 1),
            alignment: Alignment.topCenter,
            child: MyCard(
              gradient: gradient[i < gradient.length ? i : gradient.length - 1],
              color: i != count - 1 ? Colors.black.withOpacity(opacityFactor * (count - i - 1)) : null,
              child: i == count - 1 ? child : null,
            ),
          ),
        ),
      );
    }
    return cards;
  }
}

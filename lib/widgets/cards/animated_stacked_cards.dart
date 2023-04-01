import 'package:flutter/material.dart';

import 'my_card.dart';

class AniStackedCards extends StatefulWidget {
  final int repeat;
  final Widget child;
  final Color? color;
  final List<List<Gradient>> gradients;
  final Function onTap;

  final double scaleFactor;
  final double opacityFactor;

  const AniStackedCards({
    super.key,
    required this.child,
    required this.gradients,
    required this.onTap,
    this.repeat = 1,
    this.scaleFactor = .11,
    this.opacityFactor = .2,
    this.color,
  });

  @override
  State<AniStackedCards> createState() => _AniStackedCardsState();
}

class _AniStackedCardsState extends State<AniStackedCards> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  double dragDistance = 0;

  void _onPanUpdate(DragUpdateDetails details) {
    dragDistance = details.delta.distance;
  }

  void _onPanEnd(DragEndDetails details) {
    if (dragDistance > 1) {
      widget.onTap();
      print('\n$dragDistance\n');
      dragDistance = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = currentIndex; i < currentIndex + widget.repeat; i++)
          if (i >= 0) _buildCardWidget(i),
      ],
    );
  }

  Widget _buildCardWidget(int index) {
    final double gap = 445 / (widget.scaleFactor * 100) - 30;
    final double topPadding = gap * index;

    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      // onTap: () => widget.onTap(),
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Transform.scale(
          scale: 1 - widget.scaleFactor * (widget.repeat - index - 1),
          alignment: Alignment.topCenter,
          child: MyCard(
            gradients: widget.gradients[index < widget.gradients.length ? index : widget.gradients.length - 1],
            color: index != widget.repeat - 1
                ? Colors.black.withOpacity(widget.opacityFactor * (widget.repeat - index - 1))
                : null,
            child: index == widget.repeat - 1 ? widget.child : null,
          ),
        ),
      ),
    );
  }
}

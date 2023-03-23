import 'package:flutter/material.dart';

import 'my_card.dart';

class AniStackedCards extends StatefulWidget {
  final int repeat;
  final Widget child;
  final Color? color;
  final List<Gradient> gradient;
  final Function onTap;

  final double scaleFactor;
  final double opacityFactor;

  const AniStackedCards({
    super.key,
    required this.child,
    required this.gradient,
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
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  int currentIndex = 0;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      // ignore: prefer_const_constructors
      end: Offset(5, 5),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!isAnimating) {
      setState(() {});
      _animationController.value = details.delta.dx / context.size!.width;
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_animationController.value.abs() > 2) {
      widget.onTap();
      isAnimating = true;
      _animationController.forward().then((_) {
        setState(() {
          currentIndex++;
          isAnimating = false;
        });
      });
    } else {
      isAnimating = true;
      _animationController.reverse().then((_) {
        setState(() {
          isAnimating = false;
        });
      });
    }
  }

  Widget _buildCardWidget(int index) {
    final double gap = 445 / (widget.scaleFactor * 100) - 30;
    final double topPadding = gap * index;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Transform.scale(
        scale: 1 - widget.scaleFactor * (widget.repeat - index - 1),
        alignment: Alignment.topCenter,
        child: SlideTransition(
          position: _slideAnimation,
          child: MyCard(
            gradient: widget.gradient[index < widget.gradient.length ? index : widget.gradient.length - 1],
            color: index != widget.repeat - 1
                ? Colors.black.withOpacity(widget.opacityFactor * (widget.repeat - index - 1))
                : null,
            child: index == widget.repeat - 1 ? widget.child : null,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      // onTap: () => widget.onTap(),
      child: Stack(
        children: [
          for (int i = currentIndex; i < currentIndex + widget.repeat; i++)
            if (i >= 0) _buildCardWidget(i),
        ],
      ),
    );
  }
}

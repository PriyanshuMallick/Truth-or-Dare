// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme/app_consts.dart';
import '../theme/app_styles.dart';
import '../utils/app_layout.dart';
import '../widgets/incremental_text.dart';

class GameCard extends StatelessWidget {
  final String title;
  final Function subTitle;
  final List<Gradient> gradient;

  const GameCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return _AniStackedCards(
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

class _Card extends StatelessWidget {
  final Widget? child;
  final Gradient gradient;
  final Color? color;
  const _Card({required this.gradient, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConsts.cardHeight,
      width: AppConsts.cardWidth,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: color,
        child: child,
      ),
    );
  }
}

class _StackedCards extends StatelessWidget {
  final int repeat;
  final Widget child;
  final Color? color;
  final List<Gradient> gradient;

  final double scaleFactor;
  final double opacityFactor;

  const _StackedCards({
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
            child: _Card(
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

class _AniStackedCards extends StatefulWidget {
  final int repeat;
  final Widget child;
  final Color? color;
  final List<Gradient> gradient;

  final double scaleFactor;
  final double opacityFactor;

  const _AniStackedCards({
    required this.child,
    required this.gradient,
    this.repeat = 1,
    this.scaleFactor = .11,
    this.opacityFactor = .2,
    this.color,
  });

  @override
  State<_AniStackedCards> createState() => _AniStackedCardsState();
}

class _AniStackedCardsState extends State<_AniStackedCards> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _leftAnimation;
  late Animation<double> _topAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _differenceAnimation;

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
      end: const Offset(-1, 0),
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
    if (_animationController.value > 0.5) {
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
          child: _Card(
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
      child: Stack(
        children: [
          for (int i = currentIndex; i < currentIndex + widget.repeat; i++)
            if (i >= 0) _buildCardWidget(i),
        ],
      ),
    );
  }
}

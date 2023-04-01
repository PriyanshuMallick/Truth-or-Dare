import 'dart:async';

import 'package:flutter/material.dart';
import '../../theme/app_styles.dart';

class IncrementalText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final Duration duration;
  final Color cursorColor;
  final double cursorWidth;
  final double cursorHeight;

  const IncrementalText({
    super.key,
    required this.text,
    this.style = AppStyles.headLineStyle4,
    this.duration = const Duration(milliseconds: 50),
    this.textAlign = TextAlign.center,
    this.cursorColor = Colors.black,
    this.cursorWidth = 2.0,
    this.cursorHeight = 20.0,
  });

  Stream<String> get _textStream async* {
    for (var i = 1; i <= text.length; i++) {
      await Future.delayed(duration);
      yield text.substring(0, i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _textStream,
      builder: (context, snapshot) {
        final displayedText = snapshot.data ?? '';
        return Text(
          displayedText,
          style: style,
          textAlign: textAlign,
        );
      },
    );
  }
}

//? Text With blinking cursor (_InsertHighlight)
//? Replace the return value of IncrementalText's build method with this one
// return Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Flexible(
//       child: Text(
//         displayedText,
//         style: style,
//         textAlign: textAlign,
//       ),
//     ),
// if (displayedText.length != text.length) const _InsertHighlight()
// ],
// );

class _InsertHighlight extends StatefulWidget {
  const _InsertHighlight();

  @override
  State<_InsertHighlight> createState() => __InsertHighlightState();
}

class __InsertHighlightState extends State<_InsertHighlight> with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 500);
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Container(
        color: Colors.white,
        height: 24,
        width: 4,
      ),
    );
  }
}

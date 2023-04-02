import 'package:flutter/material.dart';

import '../../theme/app_styles.dart';

class ChangingText extends StatelessWidget {
  final Function changingText;
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final Duration delay;
  final Duration duration;

  const ChangingText({
    super.key,
    required this.text,
    required this.changingText,
    this.style = AppStyles.headLineStyle3,
    this.textAlign = TextAlign.center,
    this.delay = const Duration(milliseconds: 90),
    this.duration = const Duration(seconds: 4),
  });

  Stream<String> get _textStream async* {
    final endTime = DateTime.now().add(duration);
    while (DateTime.now().isBefore(endTime)) {
      await Future.delayed(delay);
      yield changingText().toString();
    }
    yield text;
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

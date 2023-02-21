import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_styles.dart';

class IncrementalText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Duration duration;
  const IncrementalText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 50),
    this.textAlign,
  });
  @override
  State<IncrementalText> createState() => _IncrementalTextState();
}

class _IncrementalTextState extends State<IncrementalText> {
  String _displayedText = '';
  int length = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(widget.duration, (timer) {
      setState(() {
        // if (_displayedText.length >= widget.text.length) {
        if (length >= widget.text.length) {
          length = 0;
          timer.cancel();
          return;
        }

        // _displayedText = widget.text.substring(0, _displayedText.length + 1);
        _displayedText = widget.text.substring(0, length + 1);
        length++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style ?? AppStyles.headLineStyle3,
      textAlign: widget.textAlign ?? TextAlign.center,
    );
  }
}

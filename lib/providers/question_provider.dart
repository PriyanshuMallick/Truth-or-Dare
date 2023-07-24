import 'package:flutter/material.dart';

import 'package:truthordare/module/questions.dart';

class QuestionProvider extends ChangeNotifier {
  String _currentQuestion = '';

  String get currentQuestion => _currentQuestion;

  void updateQuestion({required bool isTruth}) {
    if (isTruth) {
      _currentQuestion = Questions.randomTruth;
    } else {
      _currentQuestion = Questions.randomDare;
    }

    notifyListeners();
  }
}

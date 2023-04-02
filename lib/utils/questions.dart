import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

void makeQuestions() {
  Questions.readCSV();
}

class Questions {
  static Random rand = Random();
  static final List<String> _truth = [];
  static final List<String> _dare = [];

  static int get dareLength => _dare.length;
  static int get truthLength => _truth.length;

  static String get randomTruth => getRandomText(_truth, _truth.length);
  static String get randomDare => getRandomText(_dare, _dare.length);

  static String getRandomText(List<String> list, int max, {int min = 0}) {
    String text = list[rand.nextInt(_dare.length)];
    while (text.isEmpty) {
      text = list[rand.nextInt(_dare.length)];
    }
    return text;
  }

  static Future<void> readCSV() async {
    String csvString;
    try {
      // This CSV file in not on GitHub
      csvString = await rootBundle.loadString('assets/___/Truth-or-Dare-Questions - Sheet1.csv');
    } catch (e) {
      csvString = await rootBundle.loadString('assets/questions.csv');
    }
    final List<List<dynamic>> rows = const CsvToListConverter().convert(csvString);

// Remove the header row from the list of rows
    rows.removeAt(0);

    for (var row in rows) {
      _truth.add(row[0].toString());
      _dare.add(row[1].toString());
    }
  }
}

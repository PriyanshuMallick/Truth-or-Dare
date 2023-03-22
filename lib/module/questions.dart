import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

void makeQuestions() {
  readCSV();
}

class Questions {
  static Random rand = Random();
  static int length = 0;
  static List<String> truth = [];
  static List<String> dare = [];

  static String get randomTruth => truth[rand.nextInt(truth.length)];
  static String get randomDare => dare[rand.nextInt(dare.length)];
}

Future<void> readCSV() async {
  final csvString = await rootBundle.loadString('assets/___/Truth-or-Dare-Questions - Sheet1.csv');
  final List<List<dynamic>> rows = const CsvToListConverter().convert(csvString);

// Remove the header row from the list of rows
  rows.removeAt(0);

  for (var row in rows) {
    Questions.truth.add(row[0].toString());
    Questions.dare.add(row[1].toString());
    Questions.length++;
  }
}

import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

import 'app_exceptions.dart';

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

  static Future<void> makeQuestions() async {
    List<String> csvFiles = [
      'assets/___/Truth-or-Dare-Questions - Sheet1.csv',
      'assets/___/Truth-or-Dare-Questions - Under 18.csv',
      'assets/___/Truth-or-Dare-Questions - AI Gen Under 18.csv',
    ];

    // Read the questions from the csv files into rows
    List<List<dynamic>> rows = await Questions.mergeCSVFiles(csvFiles);

    // Read and separate the question row form rows and put them in two lists: _truth, _dare
    for (var row in rows) {
      _truth.add(row[0].toString());
      _dare.add(row[1].toString());
    }
  }

  static Future<List<List<dynamic>>> mergeCSVFiles(List<String> filePaths) async {
    List<List<dynamic>> mergedRows = [];
    bool anyFilePresent = false;

    for (String filePath in filePaths) {
      try {
        List<List<dynamic>> rows = await readCSV(filePath);
        // Skip the header row
        rows.removeAt(0);
        mergedRows.addAll(rows);
        anyFilePresent = true;
      } catch (e) {
        // File not present, skip it
      }
    }

    if (!anyFilePresent) {
      // None of the files are present, fallback to assets/questions.csv
      try {
        List<List<dynamic>> rows = await readCSV('assets/questions.csv');
        // Skip the header row
        rows.removeAt(0);
        mergedRows.addAll(rows);
      } catch (e) {
        // Fallback file also not present, throw AssetNotFoundError
        throw AssetNotFoundException('No question CSV file is found');
      }
    }

    return mergedRows;
  }

  static Future<List<List<dynamic>>> readCSV(String filePath) async {
    String csvString = await rootBundle.loadString(filePath);
    return const CsvToListConverter().convert(csvString);
  }
}

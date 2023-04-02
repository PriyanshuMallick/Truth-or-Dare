import 'package:truthordare/settings/game_rules.dart';

class Player {
  final String name;

  Player(
    this.name,
  );

  int _totalDareCompleted = 0;
  int _totalTruthCompleted = 0;

  int _totalDareForfeited = 0;
  int _totalTruthForfeited = 0;

  set dareCompleted(_) => _totalDareCompleted++;
  set truthCompleted(_) => _totalTruthCompleted++;

  set dareForfeited(_) => _totalDareForfeited++;
  set truthForfeited(_) => _totalTruthForfeited++;

  int get totalDareCompleted => _totalDareCompleted;
  int get totalTruthCompleted => _totalTruthCompleted;

  int get totalDareForfeited => _totalDareForfeited;
  int get totalTruthForfeited => _totalTruthForfeited;

  int get totalDare => _totalTruthCompleted + _totalDareForfeited;
  int get totalTruth => _totalTruthCompleted + _totalDareForfeited;

  int get penalty => _totalTruthForfeited * GameRules.truthPenalty + _totalDareForfeited * GameRules.darePenalty;
  int get score => (_totalTruthCompleted * GameRules.truthScore + _totalDareCompleted * GameRules.truthScore) - penalty;

  @override
  String toString() => name;
}

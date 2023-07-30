import 'package:truthordare/settings/game_rules.dart';

class Player {
  String name;

  Player(
    this.name,
  );

  int _totalDareCompleted = 0;
  int _totalTruthCompleted = 0;

  int _totalDareForfeited = 0;
  int _totalTruthForfeited = 0;

  void dareCompleted() => _totalDareCompleted++;
  void truthCompleted() => _totalTruthCompleted++;

  void dareForfeited() => _totalDareForfeited++;
  void truthForfeited() => _totalTruthForfeited++;

  void resetScore() {
    _totalDareCompleted = 0;
    _totalTruthCompleted = 0;

    _totalDareForfeited = 0;
    _totalTruthForfeited = 0;
  }

  int get totalDareCompleted => _totalDareCompleted;
  int get totalTruthCompleted => _totalTruthCompleted;

  int get totalDareForfeited => _totalDareForfeited;
  int get totalTruthForfeited => _totalTruthForfeited;

  int get totalCompleted => _totalTruthCompleted + _totalDareCompleted;
  int get totalForfeited => _totalTruthForfeited + _totalDareForfeited;

  int get totalDare => _totalDareCompleted + _totalDareForfeited;
  int get totalTruth => _totalTruthCompleted + _totalTruthForfeited;

  int get penalty => _totalTruthForfeited * GameRules.truthPenalty + _totalDareForfeited * GameRules.darePenalty;
  int get score =>
      _totalTruthCompleted * GameRules.truthScore +
      _totalDareCompleted * GameRules.dareScore -
      penalty +
      GameRules.startingScore;

  @override
  String toString() => name;
}

import 'dart:math';

import '../module/player.dart';

class PlayersInfo {
  static Random rand = Random();
  static int get totalPlayers => 5;

  static Player _currentPlayer = players.isNotEmpty ? players.first : Player('Player 0');
  static Player get currentPlayer => _currentPlayer;

  static List<Player> players = [
    Player('Adam'),
    Player('Eve'),
    Player('Avantika'),
    Player('Ash'),
    Player('Sam'),
  ];

  static Player get randomPlayer {
    int index = rand.nextInt(players.length);
    _currentPlayer = players[index];
    return _currentPlayer;
  }
}

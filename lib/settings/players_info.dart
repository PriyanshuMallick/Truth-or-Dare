import 'dart:math';

import '../module/player.dart';

class PlayersInfo {
  static Random rand = Random();
  static int get totalPlayers => 5;

  static late Player _currentPlayer;
  static Player get currentPlayer => _currentPlayer;

  static List<Player> players = [
    Player('Adam'),
    Player('Eve'),
    Player('Avantika'),
    Player('Ash'),
    Player('Sam'),
  ];

  static Player getRandomPlayer() {
    int index = rand.nextInt(players.length);
    _currentPlayer = players[index];
    return _currentPlayer;
  }
}

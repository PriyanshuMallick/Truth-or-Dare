import 'dart:math';

import 'package:truthordare/module/player.dart';

class PlayersInfo {
  static Random rand = Random();
  static int get defaultTotalPlayers => 5;
  static int _totalPlayers = defaultTotalPlayers;
  static int get totalPlayers => _totalPlayers;
  static set totalPlayers(int x) => _totalPlayers = x > 0 ? x : 1;

  static Player _currentPlayer = players.isNotEmpty ? players.first : Player('Player 0');
  static Player get currentPlayer => _currentPlayer;

  static List<Player> players = [];

  static void resetPlayersScore() {
    for (var player in players) {
      player.resetScore();
    }
  }

  static void resetPlayersList() {
    players = [];
    updatePlayerList();
  }

  static void updatePlayerList() {
    if (totalPlayers == players.length) return;

    if (totalPlayers < players.length) {
      players.removeRange(totalPlayers, players.length);
      return;
    }

    for (int i = players.length; i < totalPlayers; i++) {
      players.add(Player('Player ${i + 1}'));
    }
  }

  static Player get randomPlayer {
    _currentPlayer = pseudoRandomPlayer;
    return _currentPlayer;
  }

  static Player _prevPseudoRandomPlayer = _currentPlayer;

  static Player get pseudoRandomPlayer {
    int index = rand.nextInt(players.length);

    while (_prevPseudoRandomPlayer.name == players[index].name) {
      index = rand.nextInt(players.length);
    }

    _prevPseudoRandomPlayer = players[index];

    return _prevPseudoRandomPlayer;
  }
}

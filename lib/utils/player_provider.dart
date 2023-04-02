import 'package:flutter/material.dart';
import 'package:truthordare/module/player.dart';
import 'package:truthordare/settings/players_info.dart';

class PlayerProvider extends ChangeNotifier {
  Player _currentPlayer = PlayersInfo.currentPlayer;

  Player get currentPlayer => _currentPlayer;

  void updatePlayer() {
    _currentPlayer = PlayersInfo.randomPlayer;
    notifyListeners();
  }

  Player get randomPlayer {
    _currentPlayer = PlayersInfo.randomPlayer;
    return _currentPlayer;
  }
}

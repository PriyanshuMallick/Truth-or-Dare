import 'package:flutter/material.dart';
import 'package:truthordare/module/player.dart';
import 'package:truthordare/settings/players_info.dart';

class PlayerProvider extends ChangeNotifier {
  Player get currentPlayer => PlayersInfo.currentPlayer;

  void updatePlayer() {
    PlayersInfo.randomPlayer;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:truthordare/module/player.dart';
import 'package:truthordare/settings/players_info.dart';

class PlayerInfoProvider extends ChangeNotifier {
  int get totalPlayers => PlayersInfo.totalPlayers;
  List<Player> get players => PlayersInfo.players;

  void updateTotalPlayers(int totalPlayers) {
    PlayersInfo.totalPlayers = totalPlayers;
    PlayersInfo.updatePlayerList();
    notifyListeners();
  }

  void updatePlayerName(String name, int index) {
    if (index < 0) {
      PlayersInfo.players.first.name = name;
    } else if (index >= players.length) {
      PlayersInfo.players.last.name = name;
    } else {
      PlayersInfo.players[index].name = name;
    }

    notifyListeners();
  }
}

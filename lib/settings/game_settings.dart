class GameSettings {
  static bool isGameMode = false;

  static bool canGoToQuestionScreen = true;

  static int _maxPlayers = 20;
  static int get maxPlayers => _maxPlayers;
  static set maxPlayers(int max) => _maxPlayers = max < _minPlayers ? _minPlayers + 1 : max;

  static int _minPlayers = 1;
  static int get minPlayers => _minPlayers;
  static set minPlayers(int min) => _minPlayers = min < 1
      ? 1
      : min > _maxPlayers
          ? _maxPlayers - 1
          : min;

  static int _randomizationTimeInMilisec = 2000;
  static int get randomizationTimeInMilisec => _randomizationTimeInMilisec;
  static set randomizationTimeInMilisec(int ms) => _randomizationTimeInMilisec = ms < 0 ? 0 : ms;
}

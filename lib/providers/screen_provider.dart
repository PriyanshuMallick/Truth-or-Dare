import 'package:flutter/material.dart';

import 'package:truthordare/utils/lists/bottom_navs_list.dart';

class ScreenProvider extends ChangeNotifier {
  int _selectedScreenIndex = 2;
  int get selectedScreenIndex => _selectedScreenIndex;
  void changeBottomNavScreen(int index) {
    if (0 >= index || index < bottomNavsList.length) {
      _selectedScreenIndex = index;
    }
    notifyListeners();
  }
}

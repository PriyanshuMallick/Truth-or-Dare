import 'package:flutter/material.dart';
import 'package:truthordare/utils/lists/bottom_navs_list.dart';
import 'package:truthordare/widgets/nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // ignore: unused_field
  int _selectedScreenIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //   body: getTestScreen('Test'),
      body: bottomNavsList[_selectedScreenIndex].screen,
      bottomNavigationBar: NavBar(
        navList: bottomNavsList,
        onTap: (index) => _onTap(index),
      ),
    );
  }
}

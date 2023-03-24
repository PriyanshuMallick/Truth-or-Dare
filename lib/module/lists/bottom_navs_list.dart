import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> bottomNavsList = [
  {
    'title': 'Navigation',
    'icon': FontAwesomeIcons.compass,
    'onTap': () => Fluttertoast.showToast(
          msg: 'Navigation Button',
        ),
  },
  {
    'title': 'Home',
    'icon': FontAwesomeIcons.house,
    'onTap': () => Fluttertoast.showToast(
          msg: 'Home Button',
        ),
  },
  {
    'title': 'Profile',
    'icon': FontAwesomeIcons.userNinja,
    'onTap': () => Fluttertoast.showToast(
          msg: 'Profile Button',
        ),
  },
];

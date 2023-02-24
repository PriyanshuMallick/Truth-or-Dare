import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truthordare/module/questions.dart';

import 'package:truthordare/screens/game_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  makeQuestions();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}

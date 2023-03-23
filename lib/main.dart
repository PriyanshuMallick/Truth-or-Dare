import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'module/questions.dart';
import 'screens/game_screen.dart';
import 'module/question_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  makeQuestions();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(
    ChangeNotifierProvider(
      create: (_) => QuestionProvider(),
      child: const MyApp(),
    ),
  );
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

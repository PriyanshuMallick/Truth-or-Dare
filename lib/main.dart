import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'package:truthordare/module/questions.dart';
import 'package:truthordare/screens/pre_game/welcome_screen.dart';
import 'package:truthordare/utils/player_provider.dart';
import 'package:truthordare/utils/question_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  makeQuestions();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      routes: {
        '/main': (context) => const WelcomScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'package:truthordare/module/questions.dart';
import 'package:truthordare/providers/player_info_provider.dart';
import 'package:truthordare/providers/screen_provider.dart';
import 'package:truthordare/screens/pre_game/home_screen.dart';
import 'package:truthordare/providers/player_provider.dart';
import 'package:truthordare/providers/question_provider.dart';
import 'package:truthordare/settings/players_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Questions.makeQuestions();
  PlayersInfo.updatePlayerList();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
        ChangeNotifierProvider(create: (_) => PlayerInfoProvider()),
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
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
        '/main': (context) => const HomeScreen(),
      },
    );
  }
}

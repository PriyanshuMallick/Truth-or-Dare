import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'screens/bottom_nav_bar.dart';
import 'utils/question_provider.dart';
import 'module/questions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  makeQuestions();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      routes: {
        '/main': (context) => const BottomNavBar(),
      },
    );
  }
}

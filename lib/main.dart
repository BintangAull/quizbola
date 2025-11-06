import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football Quiz',
      theme: AppTheme.lightTheme,
      home: const QuizPage(),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/question.dart';
import 'quiz_page.dart';
import '../data/questions_data.dart';
import '../data/politics_questions.dart';
import '../widgets/category_button.dart';
import '../widgets/greeting_text.dart';
import '../widgets/background_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openQuiz(BuildContext context, List<Question> questions, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizPage(
          questions: questions,
          title: title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Kategori")),

      body: BackgroundContainer(   // ✅ background & overlay dipisah
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GreetingText(),   // ✅ greeting animasi dipisah
              const SizedBox(height: 50),
              CategoryButton(
                title: "Kuis Sepak Bola",
                icon: Icons.sports_soccer,
                color: Colors.white,
                delay: 400,
                onTap: () {
                  openQuiz(context, footballQuestions, "Kuis Bola");
                },
              ),

              CategoryButton(
                title: "Kuis Politik",
                icon: Icons.account_balance,
                color: Colors.blueAccent,
                delay: 600,
                onTap: () {
                  openQuiz(context, footballPoliticsQuestions, "Kuis Politik");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

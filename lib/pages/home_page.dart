import 'package:flutter/material.dart';
import 'quiz_page.dart';
import '../data/questions_data.dart';
import '../data/politics_questions.dart';
import '../widgets/category_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openQuiz(BuildContext context, List questions, String title) {
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

      // ✅ Tambah background image
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg2.jpeg"),  // Ganti nama sesuai file lo
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ✅ Greeting text
              const Text(
                "Selamat Datang di Aplikasi QuizDarto",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 4,
                    )
                  ],
                ),
              ),

              const SizedBox(height: 40),

              CategoryButton(
                title: "Kuis Sepak Bola",
                icon: Icons.sports_soccer,
                color: Colors.white,
                onTap: () {
                  openQuiz(context, footballQuestions, "Kuis Bola");
                },
              ),

              CategoryButton(
                title: "Kuis Politik",
                icon: Icons.account_balance,
                color: Colors.blue,
                onTap: () {
                  openQuiz(context, politicsQuestions, "Kuis Politik");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

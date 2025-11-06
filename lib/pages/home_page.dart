import 'package:flutter/material.dart';
import '../models/question.dart';
import 'quiz_page.dart';
import '../data/questions_data.dart';
import '../data/politics_questions.dart';
import '../widgets/category_button.dart';
import '../widgets/greeting_text.dart';
import '../widgets/background_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();

  void openQuiz(BuildContext context, List<Question> questions, String title) {
    final String playerName = _nameController.text.trim();
    if (playerName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan nama terlebih dahulu!")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizPage(
          questions: questions,
          title: title,
          playerName: playerName, // ✅ kirim nama ke QuizPage
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Kategori")),

      body: BackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GreetingText(),
              const SizedBox(height: 30),

              // Input nama
              TextField(
                controller: _nameController,
                style: const TextStyle(
                  color: Colors.white, // ✅ teks input warna putih
                ),
                decoration: InputDecoration(
                  labelText: "Masukkan Nama",
                  labelStyle: const TextStyle(
                    color: Colors.white, // ✅ label warna putih agak transparan
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white70), // border putih
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white), // border saat fokus
                  ),
                ),
              ),

              const SizedBox(height: 30),

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

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}

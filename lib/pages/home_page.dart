import 'package:flutter/material.dart';
import '../models/question.dart';
import 'quiz_page.dart';
import '../widgets/background_container.dart';
import '../widgets/greeting_text.dart';
import '../widgets/name_input_field.dart';
import '../widgets/category_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();

  void _openQuiz(List<Question> questions, String title) {
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
          playerName: playerName,
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
              NameInputField(controller: _nameController),
              const SizedBox(height: 30),
              CategoryList(onCategoryTap: _openQuiz),
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

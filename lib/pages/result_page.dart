import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/result_card.dart'; // import widget baru

class ResultPage extends StatelessWidget {
  final int score;
  final List<Question> questions;

  const ResultPage({
    super.key,
    required this.score,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Kuis")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Skor Kamu: $score dari ${questions.length}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Pembahasan:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return ResultCard(question: questions[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Kembali ke Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

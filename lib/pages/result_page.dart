import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/result_card.dart';

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
    final int totalScorePercent = ((score / questions.length) * 100).round();
    final bool isGood = totalScorePercent >= 75;
    final String statusText = isGood ? "mahal king" : "Goblog";
    final Color progressColor = isGood ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Kuis")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Skor Kamu: $totalScorePercent - $statusText",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: progressColor,
              ),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: totalScorePercent / 100,
              minHeight: 12,
              backgroundColor: Colors.grey.shade300,
              color: progressColor,
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

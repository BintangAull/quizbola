import 'package:flutter/material.dart';
import '../models/question.dart';

class ResultCard extends StatelessWidget {
  final Question question;

  const ResultCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    final isCorrect = question.isCorrect;
    final userAnswer = question.userAnswerIndex != null
        ? question.options[question.userAnswerIndex!]
        : "Tidak dijawab";
    final correctAnswer = question.options[question.correctIndex];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pertanyaan
            Text(
              question.questionText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Jawaban user
            Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? Colors.green : Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Jawaban kamu: $userAnswer",
                    style: TextStyle(
                      color: isCorrect ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            // Jawaban benar (jika salah)
            if (!isCorrect) ...[
              const SizedBox(height: 8),
              Text(
                "Jawaban benar: $correctAnswer",
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],

            // Penjelasan
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Penjelasan:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    question.explanation,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

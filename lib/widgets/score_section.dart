import 'package:flutter/material.dart';

class ScoreSection extends StatelessWidget {
  final int scorePercentage;
  final String statusText;
  final Color progressColor;
  final String? playerName; // ✅ optional agar bisa tampilkan nama

  const ScoreSection({
    super.key,
    required this.scorePercentage,
    required this.statusText,
    required this.progressColor,
    this.playerName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${playerName != null ? '$playerName, ' : ''}Skor Kamu: $scorePercentage - $statusText",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: progressColor,
          ),
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: scorePercentage / 100,
          minHeight: 12,
          backgroundColor: Colors.grey.shade300,
          color: progressColor,
        ),
      ],
    );
  }
}

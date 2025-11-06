import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/result_card.dart';
import '../widgets/score_section.dart';
import '../widgets/back_button_section.dart';
import '../services/audio_service.dart';
import '../utils/score_calculator.dart';

class ResultPage extends StatefulWidget {
  final int score;
  final List<Question> questions;
  final String playerName; // ✅ tambahkan nama pemain

  const ResultPage({
    super.key,
    required this.score,
    required this.questions,
    required this.playerName, // wajib diteruskan dari QuizPage
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final AudioService _audioService;
  late final int _scorePercentage;

  @override
  void initState() {
    super.initState();
    _audioService = AudioService();

    _scorePercentage = ScoreCalculator.calculatePercentage(
      widget.score,
      widget.questions.length,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _audioService.playResultSound(_scorePercentage);
    });
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusText = ScoreCalculator.getStatusText(_scorePercentage);
    final progressColor = ScoreCalculator.getProgressColor(_scorePercentage);

    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Kuis")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section skor + nama pemain
            ScoreSection(
              scorePercentage: _scorePercentage,
              statusText: statusText,
              progressColor: progressColor,
              playerName: widget.playerName, // ✅ tampilkan nama
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
            // List pembahasan per soal
            Expanded(
              child: ListView.builder(
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  return ResultCard(question: widget.questions[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            // Tombol kembali ke HomePage
            const BackButtonSection(),
          ],
        ),
      ),
    );
  }
}

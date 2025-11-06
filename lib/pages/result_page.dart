import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/result_card.dart';
import '../services/audio_service.dart';
import '../utils/score_calculator.dart';

class ResultPage extends StatefulWidget {
  final int score;
  final List<Question> questions;

  const ResultPage({
    super.key,
    required this.score,
    required this.questions,
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

    // Inisialisasi
    _audioService = AudioService();
    _scorePercentage = ScoreCalculator.calculatePercentage(
      widget.score,
      widget.questions.length,
    );

    // Play sound setelah frame pertama
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
      appBar: AppBar(
        title: const Text("Hasil Kuis"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildScoreSection(statusText, progressColor),
            const SizedBox(height: 20),
            _buildDiscussionLabel(),
            const SizedBox(height: 10),
            _buildQuestionList(),
            const SizedBox(height: 20),
            _buildBackButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreSection(String statusText, Color progressColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skor Kamu: $_scorePercentage - $statusText",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: progressColor,
          ),
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: _scorePercentage / 100,
          minHeight: 12,
          backgroundColor: Colors.grey.shade300,
          color: progressColor,
        ),
      ],
    );
  }

  Widget _buildDiscussionLabel() {
    return const Text(
      "Pembahasan:",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildQuestionList() {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          return ResultCard(question: widget.questions[index]);
        },
      ),
    );
  }

  Widget _buildBackButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text("Kembali ke Home"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/question.dart';
import '../widgets/result_card.dart';

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
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();

    // inisialisasi AudioPlayer
    audioPlayer = AudioPlayer();

    // mainkan suara setelah frame pertama
    WidgetsBinding.instance.addPostFrameCallback((_) {
      playSound();
    });
  }

  void playSound() async {
    final int totalScorePercent =
    ((widget.score / widget.questions.length) * 100).round();

    if (totalScorePercent >= 75) {
      // suara A jika skor >= 75
      await audioPlayer.play(AssetSource('sounds/siuuu.mp3'));
    } else {
      // suara B jika skor < 75
      await audioPlayer.play(AssetSource('sounds/soundketawa.mp3'));
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int totalScorePercent =
    ((widget.score / widget.questions.length) * 100).round();
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
            // Score + status
            Text(
              "Skor Kamu: $totalScorePercent - $statusText",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: progressColor,
              ),
            ),
            const SizedBox(height: 10),

            // Progress bar
            LinearProgressIndicator(
              value: totalScorePercent / 100,
              minHeight: 12,
              backgroundColor: Colors.grey.shade300,
              color: progressColor,
            ),
            const SizedBox(height: 20),

            // Label pembahasan
            const Text(
              "Pembahasan:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),

            // List jawaban + pembahasan
            Expanded(
              child: ListView.builder(
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  return ResultCard(question: widget.questions[index]);
                },
              ),
            ),
            const SizedBox(height: 20),

            // Tombol kembali
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
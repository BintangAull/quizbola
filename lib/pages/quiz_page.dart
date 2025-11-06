import 'package:flutter/material.dart';
import 'package:quizbola/pages/result_page.dart';
import '../models/question.dart';
import '../widgets/answer_option.dart';
import '../widgets/question_card.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final String title;
  final String playerName; // ✅ nama pemain

  const QuizPage({
    super.key,
    required this.questions,
    required this.title,
    required this.playerName, // ✅ tambahkan playerName
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int? selectedIndex;

  // Hitung score dari jawaban yang benar
  int get score {
    int count = 0;
    for (var q in widget.questions) {
      if (q.userAnswerIndex != null && q.userAnswerIndex == q.correctIndex) {
        count++;
      }
    }
    return count;
  }

  void nextQuestion() {
    // SIMPAN jawaban user ke model Question
    widget.questions[currentIndex].userAnswerIndex = selectedIndex;

    if (currentIndex < widget.questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null; // reset pilihan
      });
    } else {
      // Pindah ke ResultPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(
            score: score,
            questions: widget.questions,
            playerName: widget.playerName, // ✅ teruskan nama
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Progress soal
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Halo ${widget.playerName}, Soal ${currentIndex + 1} dari ${widget.questions.length}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Soal card
            QuestionCard(question: question.questionText),

            // Pilihan jawaban
            ...List.generate(
              question.options.length,
                  (i) => AnswerOption(
                text: question.options[i],
                isSelected: selectedIndex == i,
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
              ),
            ),

            const Spacer(),

            // Tombol lanjut / lihat hasil
            ElevatedButton(
              onPressed: selectedIndex == null ? null : nextQuestion,
              child: Text(
                currentIndex == widget.questions.length - 1
                    ? "Lihat Hasil"
                    : "Lanjut",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

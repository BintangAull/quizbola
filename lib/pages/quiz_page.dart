import 'package:flutter/material.dart';
import 'package:quizbola/pages/result_page.dart';
import '../models/question.dart';
import '../widgets/answer_option.dart';
import '../widgets/question_card.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final String title;

  const QuizPage({
    super.key,
    required this.questions,
    required this.title,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int? selectedIndex;

  // Hitung score dari questions yang sudah dijawab
  int get score {
    return widget.questions.where((q) => q.isCorrect).length;
  }

  void nextQuestion() {
    // SIMPAN jawaban user ke model SEBELUM pindah soal
    widget.questions[currentIndex].userAnswerIndex = selectedIndex;

    // Cek apakah soal terakhir
    if (currentIndex < widget.questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null; // reset pilihan untuk soal berikutnya
      });
    } else {
      // Pindah ke result page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(
            score: score,
            questions: widget.questions,
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
            // Progress indicator
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Soal ${currentIndex + 1} dari ${widget.questions.length}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            QuestionCard(question: question.questionText),

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
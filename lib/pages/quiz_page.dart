import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../widgets/answer_option.dart';
import '../widgets/question_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int? selectedIndex;
  int score = 0;

  void nextQuestion() {
    if (selectedIndex == footballQuestions[currentIndex].correctIndex) {
      score++;
    }

    if (currentIndex < footballQuestions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Kuis Selesai!"),
          content: Text("Skor kamu: $score dari ${footballQuestions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentIndex = 0;
                  score = 0;
                  selectedIndex = null;
                });
              },
              child: const Text("Main Lagi"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = footballQuestions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Football Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            QuestionCard(question: question.questionText),

            // opsi jawaban
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

            // tombol lanjut
            ElevatedButton(
              onPressed: selectedIndex == null ? null : nextQuestion,
              child: const Text("Lanjut"),
            ),
          ],
        ),
      ),
    );
  }
}

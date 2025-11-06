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
  int score = 0;

  void nextQuestion() {
    if (selectedIndex == widget.questions[currentIndex].correctIndex) {
      score++;
    }

    if (currentIndex < widget.questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(
            score: score,
            questions: widget.questions,
          ),
        ),
      );

      // setState(() {
      //   currentIndex = 0;
      //   selectedIndex = null;
      //   score = 0;
      // });
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
              child: const Text("Lanjut"),
            ),
          ],
        ),
      ),
    );
  }
}
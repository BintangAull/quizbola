import 'package:flutter/material.dart';
import '../data/politics_questions.dart';
import '../data/questions_data.dart';
import '../models/question.dart';
import '../widgets/category_button.dart';

class CategoryList extends StatelessWidget {
  final void Function(List<Question> questions, String title) onCategoryTap;

  const CategoryList({super.key, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryButton(
          title: "Kuis Sepak Bola",
          icon: Icons.sports_soccer,
          color: Colors.white,
          delay: 400,
          onTap: () {
            onCategoryTap(
              // import footballQuestions dari data/questions_data.dart
              footballQuestions,
              "Kuis Bola",
            );
          },
        ),
        const SizedBox(height: 20),
        CategoryButton(
          title: "Kuis Politik",
          icon: Icons.account_balance,
          color: Colors.blueAccent,
          delay: 600,
          onTap: () {
            onCategoryTap(
              // import footballPoliticsQuestions dari data/politics_questions.dart
              footballPoliticsQuestions,
              "Kuis Politik",
            );
          },
        ),
      ],
    );
  }
}

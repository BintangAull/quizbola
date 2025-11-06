import 'package:flutter/material.dart';

class ScoreCalculator {
  static const int PASSING_SCORE = 75;

  static int calculatePercentage(int score, int totalQuestions) {
    return ((score / totalQuestions) * 100).round();
  }

  static bool isPassing(int scorePercentage) {
    return scorePercentage >= PASSING_SCORE;
  }

  static String getStatusText(int scorePercentage) {
    return isPassing(scorePercentage) ? "mahal king" : "Goblog";
  }

  static Color getProgressColor(int scorePercentage) {
    return isPassing(scorePercentage) ? Colors.green : Colors.red;
  }
}
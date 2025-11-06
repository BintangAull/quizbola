class Question {
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  // TAMBAHKAN INI: untuk menyimpan jawaban user
  int? userAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.userAnswerIndex, // default null
  });

  // Helper method untuk cek apakah jawaban user benar
  bool get isCorrect => userAnswerIndex == correctIndex;

  // Helper method untuk cek apakah sudah dijawab
  bool get isAnswered => userAnswerIndex != null;
}
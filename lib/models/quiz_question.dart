// Model untuk merepresentasikan satu pertanyaan quiz
// Class ini immutable (tidak bisa diubah setelah dibuat) karena pakai final
class QuizQuestion {
  final String question;        // Pertanyaan yang ditampilkan
  final List<String> options;   // List pilihan jawaban (A, B, C, D)
  final int correctAnswerIndex; // Index jawaban yang benar (0-3)
  final String explanation;     // Penjelasan jawaban (opsional)

  // Constructor dengan named parameters untuk clarity
  // {} artinya semua parameter wajib diisi (required)
  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.explanation = '',
  });

  // Method untuk cek apakah jawaban user benar
  // Menerima index pilihan user, return true/false
  bool isCorrectAnswer(int selectedIndex) {
    return selectedIndex == correctAnswerIndex;
  }

  // Getter untuk dapetin jawaban yang benar (String)
  String get correctAnswer {
    return options[correctAnswerIndex];
  }
}
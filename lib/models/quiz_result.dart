// Model untuk menyimpan hasil quiz user
class QuizResult {
  final String userName;              // Nama user yang ikut quiz
  final int totalQuestions;           // Total pertanyaan
  final int correctAnswers;           // Jumlah jawaban benar
  final List<int> userAnswers;        // List jawaban user (index dari options)
  final DateTime completedAt;         // Waktu selesai quiz

  const QuizResult({
    required this.userName,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.userAnswers,
    required this.completedAt,
  });

  // Getter untuk calculate persentase score
  // Return double dengan 2 decimal places
  double get scorePercentage {
    if (totalQuestions == 0) return 0.0;
    return (correctAnswers / totalQuestions) * 100;
  }

  // Getter untuk dapetin grade berdasarkan score
  String get grade {
    final percentage = scorePercentage;
    if (percentage >= 90) return 'A';
    if (percentage >= 80) return 'B';
    if (percentage >= 70) return 'C';
    if (percentage >= 60) return 'D';
    return 'E';
  }

  // Getter untuk performance message
  String get performanceMessage {
    final percentage = scorePercentage;
    if (percentage >= 90) return 'Luar Biasa! 🏆';
    if (percentage >= 80) return 'Bagus Sekali! 🎉';
    if (percentage >= 70) return 'Cukup Baik! 👍';
    if (percentage >= 60) return 'Perlu Belajar Lagi! 📚';
    return 'Semangat Terus! 💪';
  }
}
import '../models/quiz_question.dart';

// Data source untuk semua pertanyaan quiz
// Ini dummy data, bisa diganti dengan API call nantinya
class QuestionsData {
  // Static const list = shared across all instances, memory efficient
  static const List<QuizQuestion> footballQuestions = [
    QuizQuestion(
      question: 'Siapa pemain yang memegang rekor pencetak gol terbanyak di Liga Champions?',
      options: [
        'Lionel Messi',
        'Cristiano Ronaldo',
        'Robert Lewandowski',
        'Karim Benzema',
      ],
      correctAnswerIndex: 1,
      explanation: 'Cristiano Ronaldo adalah pencetak gol terbanyak di Liga Champions dengan 140+ gol.',
    ),
    QuizQuestion(
      question: 'Klub mana yang menjuarai Liga Champions paling banyak?',
      options: [
        'AC Milan',
        'Bayern Munich',
        'Liverpool',
        'Real Madrid',
      ],
      correctAnswerIndex: 3,
      explanation: 'Real Madrid menjuarai Liga Champions sebanyak 15 kali, lebih banyak dari klub manapun.',
    ),
    QuizQuestion(
      question: 'Di negara mana Piala Dunia 2022 diselenggarakan?',
      options: [
        'Rusia',
        'Qatar',
        'Brasil',
        'Jerman',
      ],
      correctAnswerIndex: 1,
      explanation: 'Piala Dunia 2022 diselenggarakan di Qatar, pertama kalinya di Timur Tengah.',
    ),
    QuizQuestion(
      question: 'Pemain mana yang menjadi top scorer Premier League musim 2023/24?',
      options: [
        'Mohamed Salah',
        'Erling Haaland',
        'Harry Kane',
        'Son Heung-min',
      ],
      correctAnswerIndex: 1,
      explanation: 'Erling Haaland mencetak gol terbanyak di Premier League musim 2023/24.',
    ),
    QuizQuestion(
      question: 'Liverpool menjuarai Liga Champions untuk kali ke-6 pada tahun berapa?',
      options: [
        '2005',
        '2018',
        '2019',
        '2020',
      ],
      correctAnswerIndex: 2,
      explanation: 'Liverpool menjuarai Liga Champions ke-6 pada 2019 dengan mengalahkan Tottenham 2-0.',
    ),
    QuizQuestion(
      question: 'Siapa manajer Liverpool yang membawa klub juara Liga Champions 2019?',
      options: [
        'Rafael Benitez',
        'Brendan Rodgers',
        'Jurgen Klopp',
        'Kenny Dalglish',
      ],
      correctAnswerIndex: 2,
      explanation: 'Jurgen Klopp adalah manajer yang membawa Liverpool juara Liga Champions 2019.',
    ),
    QuizQuestion(
      question: 'Berapa jumlah pemain dalam satu tim sepak bola di lapangan?',
      options: [
        '9 pemain',
        '10 pemain',
        '11 pemain',
        '12 pemain',
      ],
      correctAnswerIndex: 2,
      explanation: 'Setiap tim sepak bola terdiri dari 11 pemain di lapangan, termasuk 1 kiper.',
    ),
    QuizQuestion(
      question: 'Negara mana yang menjuarai Piala Dunia paling banyak?',
      options: [
        'Argentina',
        'Jerman',
        'Italia',
        'Brasil',
      ],
      correctAnswerIndex: 3,
      explanation: 'Brasil menjuarai Piala Dunia sebanyak 5 kali, lebih banyak dari negara manapun.',
    ),
    QuizQuestion(
      question: 'Siapa pemain yang dijuluki "The Egyptian King"?',
      options: [
        'Mohamed Elneny',
        'Mohamed Salah',
        'Ahmed Hegazi',
        'Mahmoud Trezeguet',
      ],
      correctAnswerIndex: 1,
      explanation: 'Mohamed Salah dijuluki "The Egyptian King" karena performanya yang luar biasa.',
    ),
    QuizQuestion(
      question: 'Stadion apa yang menjadi kandang Liverpool FC?',
      options: [
        'Old Trafford',
        'Emirates Stadium',
        'Anfield',
        'Stamford Bridge',
      ],
      correctAnswerIndex: 2,
      explanation: 'Anfield adalah stadion kandang Liverpool FC sejak 1892.',
    ),
  ];

  // Method untuk get pertanyaan berdasarkan index
  static QuizQuestion getQuestion(int index) {
    return footballQuestions[index];
  }

  // Method untuk get total jumlah pertanyaan
  static int get totalQuestions => footballQuestions.length;

  // Method untuk shuffle pertanyaan (optional, buat variasi)
  static List<QuizQuestion> getShuffledQuestions() {
    final questions = List<QuizQuestion>.from(footballQuestions);
    questions.shuffle(); // Shuffle in-place
    return questions;
  }
}
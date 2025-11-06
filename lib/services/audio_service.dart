import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Konstanta untuk threshold
  static const int PASSING_SCORE = 75;

  Future<void> playResultSound(int scorePercentage) async {
    try {
      if (scorePercentage >= PASSING_SCORE) {
        await _audioPlayer.play(AssetSource('sounds/siuuu.mp3'));
      } else {
        await _audioPlayer.play(AssetSource('sounds/soundketawa.mp3'));
      }
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
import 'package:just_audio/just_audio.dart';

class AuroraAudioService {
  final AudioPlayer _player = AudioPlayer();

  AudioPlayer get player => _player;

  Future<void> playUri(String url) async {
    await _player.setUrl(url);
    _player.play();
  }

  void dispose() => _player.dispose();
}

import 'package:audioplayers/audioplayers.dart';

class PlayerHandler {
  PlayerHandler._();
  static final instance = PlayerHandler._();

  final _player = AudioPlayer();

  String url = '';
  bool isPlaying = false;

  void play(String url) async {
    if (url != this.url) {
      this.url = url;
      await _player.stop();
      await _player.setSourceUrl(url);
    }
    resume();
  }

  void resume() {
    _player.resume();
    isPlaying = true;
  }

  void pause() {
    _player.pause();
    isPlaying = false;
  }
}

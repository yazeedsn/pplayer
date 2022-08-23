import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class PlayerModel extends ChangeNotifier {
  PlayerModel({
    required this.url,
  }) {
    _initilizePlayer();
  }

  Future<void> _initilizePlayer() async {
    _player = AudioPlayer();
    await _player.setSourceUrl(url);
    _player.onPositionChanged.listen((event) {
      _position = event.inSeconds.toDouble() / 10;
      notifyListeners();
    });
    _player.onPlayerComplete.listen((event) {
      _isPlaying = false;
      _position = 0;
      notifyListeners();
    });
    _initilized = true;
  }

  final String url;
  late final AudioPlayer _player;

  bool _isPlaying = false;
  bool _initilized = false;
  double _position = 0;

  bool get isPlaying => _isPlaying;
  double get position => _position;

  void play() {
    if (_initilized) {
      _player.resume();
    }
    _isPlaying = true;
    notifyListeners();
  }

  void pause() {
    if (_initilized) {
      _player.pause();
    }
    _isPlaying = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

import 'package:task/Model/audio_player_model.dart';

abstract class HomeRepository {
  Future<AudioModel> getAllAudio();
  Future<void> cacheAudio(String audioUrl);
  Future<void> playAudio();
}

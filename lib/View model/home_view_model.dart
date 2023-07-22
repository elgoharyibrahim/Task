import 'package:task/Model/audio_player_model.dart';

import '../repositories/home/home_repository.dart';

class HomeViewModel {
  final title = "elgohary";
  HomeRepository? homeRepository;
  HomeViewModel({this.homeRepository});

  Future<AudioModel> fetchAllAudios() async {
    AudioModel audios = await homeRepository!.getAllAudio();
    return audios;
  }
}

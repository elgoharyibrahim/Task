import 'package:task/repositories/home/home_repository.dart';
import 'package:dio/dio.dart';

import '../../Model/audio_player_model.dart';
import '../../core/api/end_points.dart';

class HomeAPI extends HomeRepository {
  @override
  Future<AudioModel> getAllAudio() async {
    try {
      var response = await Dio().get(EndPoints.audioUrl);
      var data = response.data as Map<String, dynamic>;
      return AudioModel.fromJson(data);
    } catch (exception) {
      print(exception);
      return AudioModel();
    }
  }

  @override
  Future<void> cacheAudio(String audioUrl) {
    throw UnimplementedError();
  }

  @override
  Future<void> playAudio() {
    throw UnimplementedError();
  }
}

import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:task/Model/audio_player_model.dart';
import 'package:task/core/utils/app_images.dart';
import 'package:task/repositories/home/home_repository.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({
    super.key,
    required this.audioModel,
  });

  final AudioModel? audioModel;

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> implements HomeRepository{
  late AudioPlayer _audioPlayer;
  bool _isPlayed = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    cacheAudio(widget.audioModel?.audioUrl ?? ''); // Cache the audio file before playing
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () => playAudio(),
            icon: Image.asset(!_isPlayed ? AppImages.play : AppImages.pause),
          ),
          const Text("Play This"),
        ],
      ),
    );
  }
  @override
  Future<void> cacheAudio(String audioUrl) async {
    final cacheManager = DefaultCacheManager();
    await cacheManager.downloadFile(audioUrl, key: 'gohary');
  }
  @override
  Future<void> playAudio() async {
    try {
      final audioUrl = widget.audioModel?.audioUrl ?? '';
      final cacheManager = DefaultCacheManager();
      FileInfo? fileInfo = await cacheManager.getFileFromCache('gohary');

      if (fileInfo != null && fileInfo.file != null) {
        if (_isPlayed) {
          await _audioPlayer.pause();
        } else {
          final pathPrefix = Platform.isIOS ? 'file://' : '';
          await _audioPlayer.play(UrlSource(pathPrefix + fileInfo.file.path));
        }
        setState(() {
          _isPlayed = !_isPlayed;
        });
      } else {
        // File not found in cache, download and play
        await cacheAudio(audioUrl);
        await _audioPlayer.play(UrlSource(audioUrl));
      }
    } catch (e) {
      print("Error playing audio: $e");
    }
  }


  @override
  Future<AudioModel> getAllAudio() {
    // TODO: implement getAllAudio
    throw UnimplementedError();
  }


}

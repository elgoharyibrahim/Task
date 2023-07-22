import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task/repositories/home/home_repository.dart';

import 'home_repo_test.mocks.dart';

class HomeRepoTest extends Mock implements HomeRepository{}

@GenerateMocks([HomeRepoTest])
Future<void>main()async
{
  late MockHomeRepoTest homeRepo;
  setUpAll(() {
    homeRepo=MockHomeRepoTest();
  });

  group('cacheAudio function', () {
    test('should call downloadFile method with the correct parameters', () async {
      // Arrange
      final cacheManager = DefaultCacheManager();
      final audioUrl = 'https://example.com/audio.mp3';
      final expectedKey = 'gohary';

      // Act
      await homeRepo.cacheAudio( audioUrl);

      // Assert
      verify(cacheManager.downloadFile(audioUrl, key: expectedKey)).called(1);
    });
  });


  group('Play Audio function', () {
    test('', () async {
      final audioUrl = 'https://example.com/audio.mp3';
      final cacheManager = DefaultCacheManager();
      FileInfo? fileInfo = await cacheManager.getFileFromCache('gohary');
      // Act
      await homeRepo.playAudio();
      verify(fileInfo??"null").called(1);
    });
  });


}

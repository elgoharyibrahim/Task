import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/View/home/audio_widget.dart';
import 'package:task/View/home/favorite_widget.dart';
import 'package:task/core/utils/app_favorites.dart';
import 'package:task/repositories/home/home_api.dart';
import 'package:task/shared/widgets/app_divider.dart';
import 'package:task/shared/widgets/app_title.dart';
import '../../Model/audio_player_model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../View model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var homeViewModel = HomeViewModel(homeRepository: HomeAPI());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppTitle(title: "This is App".tr)),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(title: 'topLikes'.tr),
              const AppDivider(),
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                itemCount: AppFavorites.length,
                itemBuilder: (ctx, index) => FavoriteWidget(favoriteModel: AppFavorites[index]),
                separatorBuilder: (_, __) => const AppDivider(),
              )
            ],
          ),
          const AppDivider(),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(title: 'listenAudios'.tr),
              const AppDivider(),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<AudioModel>(
                future: homeViewModel.fetchAllAudios(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    var audioModel = snapshot.data;
                    return AudioWidget(audioModel: audioModel);
                  }
                },
              ),
              const AppDivider(),
            ],
          ),
        ],
      ),
    );
  }
}

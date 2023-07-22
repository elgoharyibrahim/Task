import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Model/favourites_model.dart';
import 'package:task/core/utils/app_images.dart';

class FavoriteWidget extends StatefulWidget {
  final FavoriteModel favoriteModel;
  const FavoriteWidget({super.key, required this.favoriteModel});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('locale'.tr == 'en' ? widget.favoriteModel.title ?? '' : widget.favoriteModel.titleAr ?? ''),
          IconButton(
            onPressed: () => _toggleLike(),
            icon: Image.asset(
              !(widget.favoriteModel.isFavourite ?? false) ? AppImages.unlike : AppImages.like,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }

  _toggleLike() {
    widget.favoriteModel.isFavourite = !(widget.favoriteModel.isFavourite ?? false);
    setState(() {});
  }
}

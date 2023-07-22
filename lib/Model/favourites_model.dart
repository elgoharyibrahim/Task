class FavoriteModel {
  int? id;
  String? title;
  String? titleAr;
  bool? isFavourite;

  FavoriteModel({this.id, this.title, this.titleAr, this.isFavourite = false});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['titleAr'];
    isFavourite = json['isFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['titleAr'] = titleAr;
    data['isFavourite'] = isFavourite;
    return data;
  }
}

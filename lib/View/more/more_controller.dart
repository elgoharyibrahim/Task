import 'package:get/get.dart';
import 'package:task/core/shared_pref.dart';

import '../../config/themes/app_themes.dart';

class MoreController extends GetxController {
  bool isDarkMode = preferences.getBool('isDark') ?? false;

  Future<void> changThem(value) async {
    isDarkMode = value;
    changeThemeMode(value);
    await preferences.setBool("isDark", value);
    update();
  }
}

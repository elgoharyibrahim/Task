import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;
Future<void> initPref() async {
  preferences = await SharedPreferences.getInstance();
}

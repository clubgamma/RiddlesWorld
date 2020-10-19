import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const DARK_MODE_KEY = "DARK_MODE_KEY";

  setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(DARK_MODE_KEY, value);
  }

  Future<bool> isDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(DARK_MODE_KEY) ?? false;
  }
}

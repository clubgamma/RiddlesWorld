import 'package:flutter/material.dart';

import 'preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;
    themePreference.setDarkMode(value);
    notifyListeners();
  }
}

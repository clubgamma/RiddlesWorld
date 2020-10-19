import 'package:flutter/material.dart';

import '../universal/riddleWorld.dart';

class Themes {
  static final light = ThemeData(
    fontFamily: RiddleWorld.google_sans_family,
    // primarySwatch: Colors.black,
    primaryColor: Colors.white,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    accentColor: Colors.black,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final dark = ThemeData(
    fontFamily: RiddleWorld.google_sans_family,
    backgroundColor: Colors.black,
    accentColor: Colors.white,
    brightness: Brightness.dark,
  );
}

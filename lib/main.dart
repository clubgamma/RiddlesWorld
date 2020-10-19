import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/categories/FindTheThing/FindTheThingList.dart';
import 'package:riddleworld/categories/Game/ListOfGames.dart';
import 'package:riddleworld/categories/Math/MathRiddlelLists.dart';
import 'package:riddleworld/categories/Puzzle/PuzzleList.dart';
import 'package:riddleworld/categories/WhatSong/whatSongList.dart';
import 'package:riddleworld/categories/words/WordriddleLists.dart';
import 'package:riddleworld/core/theme.dart';
import 'package:riddleworld/core/theme_provider.dart';
import 'package:riddleworld/homePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RiddleWorldHome();
  }
}

class RiddleWorldHome extends StatefulWidget {
  @override
  _RiddleWorldHomeState createState() => _RiddleWorldHomeState();
}

class _RiddleWorldHomeState extends State<RiddleWorldHome> {
  ThemeProvider themeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeProvider.darkMode = await themeProvider.themePreference.isDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            title: 'Riddle World',
            debugShowCheckedModeBanner: false,
            theme: Themes.light,
            darkTheme: Themes.dark,
            themeMode: value.darkMode ? ThemeMode.dark : ThemeMode.light,
            home: Categories(),
            routes: {
              '/gamePage': (_) => GameLists(),
              '/mathPage': (_) => MathRiddles(),
              '/homePage': (_) => Categories(),
              '/findThingPage': (_) => FindTheThingList(),
              '/puzzlePage': (_) => PuzzleList(),
              '/whatSongPage': (_) => WhatSongList(),
              '/wordPage': (_) => WordsRiddleList(),
            },
          );
        },
      ),
    );
  }
}

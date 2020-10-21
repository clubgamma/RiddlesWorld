import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/categories/FindTheThing/FindTheThingList.dart';
import 'package:riddleworld/categories/Game/ListOfGames.dart';
import 'package:riddleworld/categories/Math/MathRiddlelLists.dart';
import 'package:riddleworld/categories/Preference/Preference.dart';
import 'package:riddleworld/categories/Puzzle/PuzzleList.dart';
import 'package:riddleworld/categories/WhatSong/whatSongList.dart';
import 'package:riddleworld/categories/words/WordriddleLists.dart';
import 'package:riddleworld/homePage.dart';
import 'package:riddleworld/universal/contributors.dart';
import 'package:riddleworld/universal/riddleWorld.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<AppStateNotifier>(
        create: (context) => AppStateNotifier(),
        lazy: false,
      ),
    ], child: RiddleWorldHome());
  }
}

class RiddleWorldHome extends StatefulWidget {
  @override
  _RiddleWorldHomeState createState() => _RiddleWorldHomeState();
}

class _RiddleWorldHomeState extends State<RiddleWorldHome> {
  SharedPreferences applicationPreference;
  bool firstTime;

  @override
  void initState() {
    SharedPreferences.getInstance().then((preference) {
      applicationPreference = preference;
      firstTime = applicationPreference.getBool("first_time");
      if (firstTime == null) {
        applicationPreference.setString("theme", "light").then((value) {
          print("firstTime");
          applicationPreference.setBool("first_time", false).then((value) {});
        });
        applicationPreference
            .setString("audio", "unmute")
            .then((_) => print('unmute'));
      } else {
        print("notFirstTime");
        String audio = applicationPreference.getString("audio");
        String theme = applicationPreference.getString("theme");
        if (theme == "dark") {
          Provider.of<AppStateNotifier>(context, listen: false).invertTheme();
        }

        if (audio == 'mute') {
          Provider.of<AppStateNotifier>(context, listen: false).invertAudio();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riddle World',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<AppStateNotifier>(context, listen: true).isDarkMode
          ? ThemeData(
              fontFamily: RiddleWorld.google_sans_family,
              // primarySwatch: Colors.black,
              primaryColor: Colors.black,
              disabledColor: Colors.grey,
              cardColor: Colors.black,
              canvasColor: Colors.black,
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            )
          : ThemeData(
              fontFamily: RiddleWorld.google_sans_family,
              // primarySwatch: Colors.black,
              primaryColor: Colors.white,
              disabledColor: Colors.grey,
              cardColor: Colors.white,
              canvasColor: Colors.white,
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
      home: Categories(),
      routes: {
        '/gamePage': (_) => GameLists(),
        '/mathPage': (_) => MathRiddles(),
        '/homePage': (_) => Categories(),
        '/findThingPage': (_) => FindTheThingList(),
        '/puzzlePage': (_) => PuzzleList(),
        '/whatSongPage': (_) => WhatSongList(),
        '/wordPage': (_) => WordsRiddleList(),
        '/preference': (_) => Preference(),
        '/preference/contributors': (_) => Contributors(),
      },
    );
  }
}

class AppStateNotifier extends ChangeNotifier {
  //
  bool isDarkMode = false;
  SharedPreferences applicationPreference;
  bool isMute = false;
  Future<void> invertTheme() async {
    applicationPreference = await SharedPreferences.getInstance();
    this.isDarkMode = !isDarkMode;
    if (isDarkMode) {
      await applicationPreference.setString("theme", "dark");
    } else {
      await applicationPreference.setString("theme", "light");
    }
    print(applicationPreference?.getString("theme"));
    notifyListeners();
  }

  Future<void> invertAudio() async {
    applicationPreference = await SharedPreferences.getInstance();
    this.isMute = !isMute;
    if (isMute) {
      await applicationPreference.setString("audio", "mute");
    } else {
      await applicationPreference.setString("audio", "unmute");
    }
    print(applicationPreference?.getString("audio"));
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riddleworld/homePage.dart';
import 'package:riddleworld/riddleWorld.dart';

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
    return RiddleWorldHome();
  }
}

class RiddleWorldHome extends StatefulWidget {
  @override
  _RiddleWorldHomeState createState() => _RiddleWorldHomeState();
}

class _RiddleWorldHomeState extends State<RiddleWorldHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'dart:math';
import '../../../main.dart';
import '../../../universal/result.dart';
import 'colors.dart';
import 'randomRGB.dart';

class FirstGame extends StatefulWidget {
  // FirstGame({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _FirstGameState createState() => _FirstGameState();
}

class _FirstGameState extends State<FirstGame> {
  Random random = Random();
  int randomR;
  int randomG;
  int randomB;

  int totalScore = 0;
  int questionCount = 0;

  void answerChooseHandler(int r, int g, int b) {
    if (r == randomR && g == randomG && b == randomB) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "CORRECT",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        totalScore += 1;
        questionCount += 1;
      });
    } else {
      Fluttertoast.cancel();

      Fluttertoast.showToast(
          msg: "WRONG",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        questionCount += 1;
      });
    }
  }

  void resetHanlder() {
    setState(() {
      totalScore = 0;
      questionCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    randomR = random.nextInt(256);
    randomG = random.nextInt(256);
    randomB = random.nextInt(256);

    return RiddleBar(
      cross: true,
      title: 'GUESS THE COLOR',
      body: questionCount < 5
          ? Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Provider.of<AppStateNotifier>(context,
                                            listen: true)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                            color: Colors.transparent),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'IT WILL GENERATE RANDOM RGB COLOR CODES, YOU HAVE TO GUESS THE COLOR WHICH IS GIVEN BELOW.',
                              style: TextStyle(fontSize: 15),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Provider.of<AppStateNotifier>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                          color: Colors.transparent),
                      child: Column(
                        children: [
                          RGB(randomR, randomG, randomB),
                          ColorOptions(
                              randomR, randomG, randomB, answerChooseHandler),
                          SizedBox(
                            height: 60,
                          )
                        ], /*  */
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Result(totalScore, questionCount, resetHanlder, '/gamePage'),
    );
  }
}

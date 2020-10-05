import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/categories/words/words2@xyther14/words2OptionHandler.dart';
import 'package:riddleworld/categories/words/words2@xyther14/words2Questions.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'dart:math';
import '../../../main.dart';
import '../../../universal/result.dart';

class Words2HomePage extends StatefulWidget {
  @override
  _Words2HomePageState createState() => _Words2HomePageState();
}

class _Words2HomePageState extends State<Words2HomePage> {
  int totalScore = 0;
  int questionCount = 0;
  int questionIndex = 0;

  void resetHandler() {
    setState(() {
      totalScore = 0;
      questionCount = 0;
      questionIndex = 0;
    });
  }

  void answerChooseHandler(int optionNumber) {
    int correctAnswer = questions[questionIndex].correctOption;
    if (correctAnswer == optionNumber) {
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
        questionIndex += 1;
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
        questionIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      cross: true,
      title: 'WORDS PUZZLE',
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
                                width: 1.6,
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
                              'A LIST OF 5 BRAIN TEASERS. YOU HAVE TO GUESS THE RIGHT ANSWER.',
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
                              width: 1.6,
                              color: Provider.of<AppStateNotifier>(context,
                                          listen: true)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                          color: Colors.transparent),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  questions[questionIndex].question,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Words2Option(
                            questionNumber: questionIndex,
                            questions: questions,
                            optionChooser: answerChooseHandler,
                          ),
                          SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Result(totalScore, questionCount, resetHandler, '/wordPage'),
    );
  }
}

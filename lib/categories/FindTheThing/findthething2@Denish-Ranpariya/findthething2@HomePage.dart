import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riddleworld/categories/FindTheThing/findthething2@Denish-Ranpariya/question_class.dart';
import 'package:riddleworld/universal/result.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';

class FindTheThing2HomeScreen extends StatefulWidget {
  @override
  _FindTheThing2HomeScreenState createState() =>
      _FindTheThing2HomeScreenState();
}

class _FindTheThing2HomeScreenState extends State<FindTheThing2HomeScreen> {
  int number;
  bool _isScore = false;
  int totalScore = 0;
  int index = Random().nextInt(6);

  void resetHandler() {
    setState(() {
      totalScore = 0;
      _isScore = false;
      index = Random().nextInt(6);
    });
  }

  void getResult(String selectedAnswer) {
    if (selectedAnswer == questionList[index].correctAnswer) {
      setState(() {
        totalScore = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isScore
        ? Scaffold(
            body: Result(
            totalScore,
            1,
            resetHandler,
            '/findThingPage',
            answer: questionList[index].description,
          ))
        : RiddleBar(
            title: 'FIND THE ODD ONE',
            body: Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Provider.of<AppStateNotifier>(context,
                                            listen: false)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                            color: Colors.transparent),
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Find the odd one!!',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OptionButton(
                      optionString: questionList[index].option1,
                      onTap: () {
                        setState(() {
                          _isScore = true;
                        });
                        getResult(questionList[index].option1);
                      },
                    ),
                    OptionButton(
                      optionString: questionList[index].option2,
                      onTap: () {
                        setState(() {
                          _isScore = true;
                        });
                        getResult(questionList[index].option2);
                      },
                    ),
                    OptionButton(
                      optionString: questionList[index].option3,
                      onTap: () {
                        setState(() {
                          _isScore = true;
                        });
                        getResult(questionList[index].option3);
                      },
                    ),
                    OptionButton(
                      optionString: questionList[index].option4,
                      onTap: () {
                        setState(() {
                          _isScore = true;
                        });
                        getResult(questionList[index].option4);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

class OptionButton extends StatelessWidget {
  final String optionString;
  final Function onTap;

  OptionButton({this.optionString, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: Provider.of<AppStateNotifier>(context, listen: false)
                          .isDarkMode
                      ? Colors.white
                      : Colors.black),
              color: Colors.transparent),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              optionString,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}

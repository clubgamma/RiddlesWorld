import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riddleworld/universal/result.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

import 'color_class.dart';

class FindTheThing1HomeScreen extends StatefulWidget {
  @override
  _FindTheThing1HomeScreenState createState() =>
      _FindTheThing1HomeScreenState();
}

class _FindTheThing1HomeScreenState extends State<FindTheThing1HomeScreen> {
  int index = Random().nextInt(8);
  String answer;
  bool _isScore = false;
  int totalScore = 0;
  TextEditingController controller = new TextEditingController();

  void resetHandler() {
    setState(() {
      totalScore = 0;
      _isScore = false;
      index = Random().nextInt(8);
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'FIND THE BRAND NAME',
      body: _isScore
          ? Result(
              totalScore,
              1,
              resetHandler,
              '/findThingPage',
              answer: colors[index].answer,
            )
          : Scaffold(
              body: SafeArea(
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.6),
                              color: Colors.transparent),
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Guess the name of company/brand with the colors!!!',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: colors[index].color1,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: colors[index].color2,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: colors[index].color3,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  colors[index].color4 != Color(0xFFFFFFFF)
                                      ? CircleAvatar(
                                          radius: 10,
                                          backgroundColor: colors[index].color4,
                                        )
                                      : SizedBox(
                                          width: 0,
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.6),
                              color: Colors.transparent),
                          child: Column(
                            children: [
                              TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  labelText: 'Answer',
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 10, left: 10),
                                child: InkWell(
                                  onTap: () {
                                    if (controller.text.trim().toLowerCase() ==
                                        colors[index].answer) {
                                      print(colors[index].answer);
                                      setState(() {
                                        totalScore = 1;
                                        _isScore = true;
                                      });
                                    } else {
                                      print(colors[index].answer);
                                      setState(() {
                                        totalScore = 0;
                                        _isScore = true;
                                      });
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1.6),
                                        color: Colors.transparent),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Text(
                                      'SUBMIT',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

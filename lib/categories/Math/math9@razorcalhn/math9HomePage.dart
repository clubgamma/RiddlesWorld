import 'package:flutter/material.dart';
import 'package:riddleworld/universal/result.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';

class Math9HomeScreen extends StatefulWidget {
  @override
  _Math9HomeScreenState createState() => _Math9HomeScreenState();
}

class _Math9HomeScreenState extends State<Math9HomeScreen> {
  int? number;
  bool _isScore = false;
  int totalScore = 0;

  void resetHandler() {
    setState(() {
      totalScore = 0;
      _isScore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'WRONG BUT RIGHT',
      body: _isScore
          ? Result(totalScore, 1, resetHandler, '/mathPage',
              answer: totalScore != 1
                  ? ""
                  : "One+Nine+Eight= ONE, similarly Two+Eight+Nine= TEN")
          : Center(
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
                                            listen: false)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                            color: Colors.transparent),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'SUPPOSE 1+9+8=1 , THEN WHAT CAN BE 2+8+9 ?',
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
                                          listen: false)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                          color: Colors.transparent),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Answer',
                                hintText: 'Enter answer in numbers!!'),
                            keyboardType: TextInputType.number,
                            onChanged: (value) => number = int.parse(value),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 10, left: 10),
                            child: InkWell(
                              onTap: () {
                                if (number == 10) {
                                  setState(() {
                                    totalScore = 1;
                                    _isScore = true;
                                  });
                                } else {
                                  setState(() {
                                    totalScore = 0;
                                    _isScore = true;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: Provider.of<AppStateNotifier>(
                                                    context,
                                                    listen: false)
                                                .isDarkMode
                                            ? Colors.white
                                            : Colors.black),
                                    color: Colors.transparent),
                                width: MediaQuery.of(context).size.width * 0.9,
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
    );
  }
}

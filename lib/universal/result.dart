import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final int questions;
  final String navigationPage;
  final Function resetHandler;
  final String answer;

  Result(this.score, this.questions, this.resetHandler, this.navigationPage,
      {this.answer});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.6), color: Colors.transparent),
              width: MediaQuery.of(context).size.width * 0.9,
              //height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Your score is',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    '$score out of $questions',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    answer ?? ' ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
              child: InkWell(
                onTap: resetHandler,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.6), color: Colors.transparent),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    'RESTART',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop(navigationPage);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.6), color: Colors.transparent),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    'BACK TO $navigationPage',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

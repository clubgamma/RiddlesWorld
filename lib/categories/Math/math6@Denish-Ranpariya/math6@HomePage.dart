import 'package:flutter/material.dart';
import 'package:riddleworld/universal/result.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'dart:math';

class Math6HomeScreen extends StatefulWidget {
  @override
  _Math6HomeScreenState createState() => _Math6HomeScreenState();
}

class _Math6HomeScreenState extends State<Math6HomeScreen> {
  int number;
  bool _isScore = false;
  int totalScore = 0;

  void resetHandler() {
    setState(() {
      totalScore = 0;
      _isScore = false;
    });
  }

  int getBinary(int input) {
    int bin = 0, i = 1;
    while (input > 0) {
      bin = bin + (input % 2) * i;
      input = (input / 2).floor();
      i = i * 10;
    }
    return bin;
  }

  int findLargestNumber(List<int> numbers) {
    int max = numbers[0];
    numbers.forEach((element) {
      if (element > max) {
        max = element;
      }
    });
    return max;
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    List<int> numbers = [];
    for (int i = 0; i < 4; i++) {
      numbers.add(random.nextInt(255));
    }
    int max = findLargestNumber(numbers);

    void getResult(int n) {
      if (n == max) {
        setState(() {
          totalScore = 1;
        });
      }
    }

    return _isScore
        ? Scaffold(body: Result(totalScore, 1, resetHandler, '/mathPage'))
        : RiddleBar(
            title: 'GREATEST BINARY',
            body: Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.6),
                            color: Colors.transparent),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'WHICH ONE IS THE GREATEST BINARY NUMBER?',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OptionButton(
                      number: getBinary(numbers[0]),
                      onTap: () {
                        setState(() {
                          _isScore = true;
                        });
                        getResult(numbers[0]);
                      },
                    ),
                    OptionButton(
                      number: getBinary(numbers[1]),
                      onTap: () {
                        setState(() {
                          _isScore = true;
                        });
                        getResult(numbers[1]);
                      },
                    ),
                    OptionButton(
                      number: getBinary(numbers[2]),
                      onTap: () {
                        setState(() {
                          _isScore = true;
                        });
                        getResult(numbers[2]);
                      },
                    ),
                    OptionButton(
                      number: getBinary(numbers[3]),
                      onTap: () {
                        setState(() {
                          _isScore = true;
                        });
                        getResult(numbers[3]);
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
  final int number;
  final Function onTap;

  OptionButton({this.number, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 1.6), color: Colors.transparent),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              number.toString().padLeft(8, '0'),
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}

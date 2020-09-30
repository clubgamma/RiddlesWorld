import 'package:flutter/material.dart';
import 'dart:math';

class ColorOption extends StatelessWidget {
  final rgb;
  final Function optionChoosenHandler;

  ColorOption(this.rgb, this.optionChoosenHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => optionChoosenHandler(rgb['r'], rgb['g'], rgb['b']),
        child: Container(
          margin: EdgeInsets.all(10),
          width: 140,
          height: 140,
          color: Color.fromRGBO(rgb['r'], rgb['g'], rgb['b'], 1),
        ),
      ),
    );
  }
}

class ColorOptions extends StatelessWidget {
  final int randomR;
  final int randomG;
  final int randomB;

  final Function answerChooseHandler;

  ColorOptions(this.randomR, this.randomG, this.randomB, this.answerChooseHandler);

  @override
  Widget build(BuildContext context) {
    List<int> optionList = [0, 1, 2, 3];

    Random random = Random();

    int answer = random.nextInt(4);

    optionList.remove(answer);

    // optionList = [0, 1, 3]

    var randomOptions = {
      answer: {'r': randomR, 'g': randomG, 'b': randomB },
      optionList[0]: {
        'r': random.nextInt(256),
        'g': random.nextInt(256),
        'b': random.nextInt(256)
      },
      optionList[1]: {
        'r': random.nextInt(256),
        'g': random.nextInt(256),
        'b': random.nextInt(256)
      },
      optionList[2]: {
        'r': random.nextInt(256),
        'g': random.nextInt(256),
        'b': random.nextInt(256)
      },
    };

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ColorOption(randomOptions[0], answerChooseHandler),
              ColorOption(randomOptions[1], answerChooseHandler)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ColorOption(randomOptions[2], answerChooseHandler),
              ColorOption(randomOptions[3], answerChooseHandler)
            ],
          ),
        ],
      ),
    );
  }
}
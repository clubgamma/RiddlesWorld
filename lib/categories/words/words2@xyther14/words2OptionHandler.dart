import 'package:flutter/material.dart';
import 'package:riddleworld/categories/words/words2@xyther14/words2Questions.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';

class Words2Option extends StatelessWidget {
  final int questionNumber;
  final List<Questions> questions;
  final Function optionChooser;

  const Words2Option({
    this.questionNumber,
    this.questions,
    this.optionChooser,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionWidget(
          questionNumber: questionNumber,
          optionNumber: 0,
          onTap: optionChooser,
        ),
        OptionWidget(
          questionNumber: questionNumber,
          optionNumber: 1,
          onTap: optionChooser,
        ),
        OptionWidget(
          questionNumber: questionNumber,
          optionNumber: 2,
          onTap: optionChooser,
        ),
        OptionWidget(
          questionNumber: questionNumber,
          optionNumber: 3,
          onTap: optionChooser,
        ),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    @required this.optionNumber,
    this.questionNumber,
    this.onTap,
  });

  final int questionNumber;
  final int optionNumber;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(optionNumber);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  questions[questionNumber].options[optionNumber],
                  style: TextStyle(fontSize: 15),
                ))),
      ),
    );
  }
}

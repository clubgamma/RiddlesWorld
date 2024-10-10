import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/categories/Puzzle/wordle@hassanteslim007/models/letter.dart';
import 'package:riddleworld/categories/Puzzle/wordle@hassanteslim007/models/word.dart';
import 'package:riddleworld/main.dart';

class Board extends StatefulWidget {
  final List<Word> words;
  const Board({super.key, required this.words});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.words
            .map((word) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: word.letters
                      .map((letter) => LetterBox(letter: letter))
                      .toList(),
                ))
            .toList());
  }
}

class LetterBox extends StatefulWidget {
  final Letter letter;
  const LetterBox({super.key, required this.letter});

  @override
  State<LetterBox> createState() => _LetterBoxState();
}

class _LetterBoxState extends State<LetterBox> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppStateNotifier>(context, listen: true);
    return Container(
      margin: const EdgeInsets.all(10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: widget.letter.status == LetterStatus.correct
            ? Colors.green
            : widget.letter.status == LetterStatus.wrong
                ? Colors.red
                : widget.letter.status == LetterStatus.inWord
                    ? Colors.amberAccent
                    : Colors.transparent,
        border: Border.all(
            color: widget.letter.status == LetterStatus.initial
                ? Colors.grey
                : Colors.transparent),
      ),
      child: Center(
        child: Text(
          widget.letter.value,
          style: TextStyle(
              color: theme.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }
}

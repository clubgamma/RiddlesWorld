import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/categories/Puzzle/wordle@hassanteslim007/utils.dart';
import 'package:riddleworld/categories/Puzzle/wordle@hassanteslim007/widgets/board.dart';
import 'package:riddleworld/categories/Puzzle/wordle@hassanteslim007/widgets/keyboard.dart';
import 'package:riddleworld/main.dart';

import 'models/letter.dart';
import 'models/word.dart';

class Wordle extends StatefulWidget {
  const Wordle({super.key});

  @override
  State<Wordle> createState() => _WordleState();
}

class _WordleState extends State<Wordle> {
  GameStatus status = GameStatus.playing;
  late String hiddenWord;
  String generateWord() {
    List<String> fiveLetterWords = [
      ...all.where((word) => word.length == 5).toList(),
      ...all.where((word) => word.length == 4).map((e) => '${e}s').toList()
    ];

    int randomIndex = Random().nextInt(fiveLetterWords.length);
    return fiveLetterWords[randomIndex].toUpperCase();
  }

  List<Word> words = List.generate(
      6, (index) => Word(List.generate(5, (index) => Letter.empty())));

  int _currentIndex = 0;

  Word? get _currentWord =>
      _currentIndex < words.length ? words[_currentIndex] : null;

  @override
  void initState() {
    getHiddenWord();
    super.initState();
  }

  void getHiddenWord() {
    hiddenWord = generateWord();
    debugPrint(hiddenWord);
  }

  final List<Letter> pressedKeys = [];
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppStateNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: theme.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text('Wordle'),
        centerTitle: true,
        backgroundColor: theme.isDarkMode ? Colors.black : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Board(words: words),
            const Spacer(),
            CustomKeyboard(
              pressedKeys: pressedKeys,
              onBackPressed: () {
                _currentWord?.removeLetter();
                setState(() {});
              },
              onEnterPressed: () {
                if (status == GameStatus.over) {
                  playAgain();
                  return;
                }
                checkLetters();
              },
              onKeyPressed: (key) {
                _currentWord?.addLetter(key);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  void checkLetters() {
    if (_currentWord!.letters.contains(Letter.empty())) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          'Word Incomplete',
        ),
        backgroundColor: Colors.red,
      ));
      return;
    } else {
      String word = _currentWord!.wordString;
      if (![
        ...all.where((word) => word.length == 5).toList(),
        ...all.where((word) => word.length == 4).map((e) => '${e}s').toList()
      ].map((e) => e.toLowerCase()).contains(word.toLowerCase())) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Word not found'),
          backgroundColor: Colors.red,
        ));
        return;
      }
      for (var i = 0; i < 5; i++) {
        if (word[i] == hiddenWord[i]) {
          setState(() {
            _currentWord!.letters[i] = _currentWord!.letters[i]
                .copyWith(value: word[i], status: LetterStatus.correct);
            pressedKeys.add(Letter(word[i], status: LetterStatus.correct));
          });
        } else if (hiddenWord.contains(word[i])) {
          setState(() {
            _currentWord!.letters[i] = _currentWord!.letters[i]
                .copyWith(value: word[i], status: LetterStatus.inWord);
            pressedKeys.add(Letter(word[i], status: LetterStatus.inWord));
          });
        } else {
          setState(() {
            _currentWord!.letters[i] = _currentWord!.letters[i]
                .copyWith(value: word[i], status: LetterStatus.wrong);
            pressedKeys.add(Letter(word[i], status: LetterStatus.wrong));
          });
        }
      }
    }
    checkWord();
    if (_currentIndex < 6) {
      _currentIndex++;
    }
  }

  void checkWord() async {
    // print(_currentWord?.wordString ?? 'I dont');
    String word = _currentWord!.wordString;
    if (word == hiddenWord) {
      status = GameStatus.over;
      await showAlertDialog(
        context,
        title: 'Congratulations, You win',
        body: ySpace(1),
        okTitle: 'Play Again',
        okPressed: () {
          playAgain();
          Navigator.pop(context);
        },
        withButton: true,
      );
    }

    if (_currentIndex == 5) {
      if (!mounted) return;
      if (word != hiddenWord) {
        status = GameStatus.over;
        await showAlertDialog(
          context,
          title: 'Sorry, You lose',
          body: Text('Correct Word is $hiddenWord'),
          okTitle: 'Play Again',
          okPressed: () {
            playAgain();
            Navigator.pop(context);
          },
          withButton: true,
        );
      }
    }
  }

  void playAgain() {
    status = GameStatus.starts;
    _currentIndex = 0;
    words.clear();
    words = List.generate(
        6, (index) => Word(List.generate(5, (index) => Letter.empty())));
    getHiddenWord();
    pressedKeys.clear();
    setState(() {});
  }
}

enum GameStatus { starts, playing, over }

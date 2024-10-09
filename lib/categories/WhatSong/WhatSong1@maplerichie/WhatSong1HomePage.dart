import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riddleworld/categories/WhatSong/WhatSong1@maplerichie/WhatSong1Questions.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'dart:math';
import '../../../universal/result.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class WhatSong1HomePage extends StatefulWidget {
  @override
  _WhatSong1HomePageState createState() => _WhatSong1HomePageState();
}

class _WhatSong1HomePageState extends State<WhatSong1HomePage> {
  int _score = 0;
  int _questionCount = 0;
  int _questionIndex = 0;
  List<Question> _questions = [];
  Random _rnd = new Random();

  @override
  void initState() {
    super.initState();
    _questions = questions;
    _questions.shuffle(_rnd);
  }

  void resetHandler() {
    setState(() {
      _score = 0;
      _questionCount = 0;
      _questionIndex = 0;
    });
  }

  void answerHandler(String answer) {
    String correctAnswer = _questions[_questionIndex].answer;
    if (correctAnswer == answer) {
      onCorrect();
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "CORRECT",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16);
      setState(() {
        _score += 1;
        _questionCount += 1;
        _questionIndex += 1;
      });
    } else {
      onWrong();
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "WRONG",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16);
      setState(() {
        _questionCount += 1;
        _questionIndex += 1;
      });
    }
  }

  void onCorrect() async {
    AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
    Provider.of<AppStateNotifier>(context, listen: false).isMute
        ? print('muted')
        : assetsAudioPlayer.open(
            Audio('assets/audios/correct.mp3'),
          );
  }

  void onWrong() async {
    AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
    Provider.of<AppStateNotifier>(context, listen: false).isMute
        ? print('muted')
        : assetsAudioPlayer.open(
            Audio('assets/audios/defeat_two.mp3'),
          );
  }

  _buildOptions(List<String> options) {
    options.shuffle(_rnd);
    return Column(
      children: options.map((option) {
        return _buildOption(option);
      }).toList(),
    );
  }

  Widget _buildOption(String option) {
    return GestureDetector(
      onTap: () {
        answerHandler(option);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
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
            option,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion(question) {
    return Container(
      width: double.infinity,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      cross: true,
      title: 'GUESS IT!',
      body: _questionCount < _questions.length
          ? Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color:
                          Provider.of<AppStateNotifier>(context, listen: false)
                                  .isDarkMode
                              ? Colors.white
                              : Colors.black),
                  color: Colors.transparent),
              child: Column(
                children: [
                  _buildQuestion(_questions[_questionIndex].question),
                  Expanded(child: SizedBox()),
                  _buildOptions(_questions[_questionIndex].options),
                ],
              ),
            )
          : Result(_score, _questionCount, resetHandler, '/whatSongPage'),
    );
  }
}

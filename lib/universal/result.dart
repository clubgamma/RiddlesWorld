import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Result extends StatefulWidget {
  final int score;
  final int questions;
  final String navigationPage;
  final Function resetHandler;
  final String answer;

  Result(this.score, this.questions, this.resetHandler, this.navigationPage,
      {this.answer});
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    super.initState();
    if (widget.score == 1) {
      AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
      assetsAudioPlayer.open(
        Audio('assets/audios/correct.mp3'),
      );
    } else {
      AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
      assetsAudioPlayer.open(
        Audio('assets/audios/defeat_two.mp3'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _scoreCard = [
      Text(
        'Your score is',
        style: TextStyle(fontSize: 22),
      ),
      Text(
        '' + widget.score.toString() + ' out of ' + widget.questions.toString(),
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      SizedBox(height: 20),
      Text(
        widget.answer ?? ' ',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    ];

    List<Widget> _listCards = [
      Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(width: 1.6), color: Colors.transparent),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _scoreCard,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
        child: InkWell(
          onTap: widget.resetHandler,
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
            Navigator.of(context).pop(widget.navigationPage);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 1.6), color: Colors.transparent),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              'BACK TO ' + widget.navigationPage.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ];

    return Align(
      alignment: Alignment.center,
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: _listCards.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _listCards[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

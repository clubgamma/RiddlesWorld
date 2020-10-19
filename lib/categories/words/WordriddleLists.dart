import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riddleworld/categories/words/words1@sayutizxc/Words1HomePage.dart';
import 'package:riddleworld/categories/words/words2@xyther14/words2HomePage.dart';
import 'package:riddleworld/categories/words/words3@tanharpatel/Words3HomeScreen.dart';
import 'package:riddleworld/categories/words/words4@c0decreat0r/Words4HomeScreen.dart';
import 'package:riddleworld/universal/actionCard.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class WordsRiddleList extends StatefulWidget {
  @override
  _StateWordsRiddleList createState() => _StateWordsRiddleList();
}

class _StateWordsRiddleList extends State<WordsRiddleList> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<ActionCard> cardList = [
      ActionCard(
          name: 'FIND THE HIDDEN WORDS',
          description:
              '''YOU HAVE TO FIND THE HIDDEN WORDS ON THE SCREEN\nby @sayutizxc''',
          number: '1',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Words1HomePage()));
          }),
      ActionCard(
          name: 'WORD PUZZLE',
          description: 'PLAY WITH WORDS\nby @xyther14',
          number: '2',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Words2HomePage()));
          }),
      ActionCard(
          name: 'FIND THE MAGIAL WORD',
          description: 'THINK SMART, NOT TOUGH\nby @tanharpatel',
          number: '3',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Words3HomeScreen()));
          }),
      ActionCard(
          name: 'HEYYY',
          description: 'YOU KNOW ME...\nby @c0decreat0r',
          number: '4',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Words4HomeScreen()));
          }),
    ];

    for (int i = 0; i < cardList.length; i++) {
      _listItems.add(cardList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'WORDS RIDDLE',
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: _listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _listItems[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

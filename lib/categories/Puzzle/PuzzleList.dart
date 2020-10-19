import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riddleworld/categories/Puzzle/puzzle1@smit4297/puzzle1homescreen.dart';
import 'package:riddleworld/universal/actionCard.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class PuzzleList extends StatefulWidget {
  @override
  _StatePuzzleList createState() => _StatePuzzleList();
}

class _StatePuzzleList extends State<PuzzleList> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<ActionCard> cardList = [
      ActionCard(
        name: 'PUZZLE MANIA',
        description: '''IMORT YOUR FAV PICTURE AND SOLVE IT\nby @smit4297''',
        number: '1',
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => PuzzleHomePage(title: "PUZZLE GAME")));
        },
      ),
    ];

    for (int i = 0; i < cardList.length; i++) {
      _listItems.add(cardList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'PUZZLE RIDDLES',
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

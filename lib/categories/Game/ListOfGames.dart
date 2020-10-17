import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riddleworld/categories/Game/game1@harshptl14/Game1homepage.dart';
import 'package:riddleworld/categories/Game/game2@tanharpatel/Games2HomeScreen.dart';
import 'package:riddleworld/universal/actionCard.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class GameLists extends StatefulWidget {
  @override
  _StateGameLists createState() => _StateGameLists();
}

class _StateGameLists extends State<GameLists> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<ActionCard> cardList = [
      ActionCard(
        name: 'GUESS THE COLOR',
        description:
            '''YOU WILL BE GIVEN RGB COLOR CODE AND YOU HAVE TO GUESS COLOR\nby @harshptl14''',
        number: '1',
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => FirstGame()));
        },
      ),
      ActionCard(
        name: 'HELLOOOOO',
        description: '''OCTOCAT WELCOMES YOU...\nby @tanharpatel''',
        number: '2',
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => Games2HomeScreen()));
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
      title: 'GAMELISTS',
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

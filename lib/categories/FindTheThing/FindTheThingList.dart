import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riddleworld/categories/FindTheThing/findthething1@Denish-Ranpariya/findthething1@HomePage.dart';
import 'package:riddleworld/categories/FindTheThing/findthething2@Denish-Ranpariya/findthething2@HomePage.dart';
import 'package:riddleworld/universal/actionCard.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class FindTheThingList extends StatefulWidget {
  @override
  _StateFindTheThingList createState() => _StateFindTheThingList();
}

class _StateFindTheThingList extends State<FindTheThingList> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<ActionCard> cardList = [
      ActionCard(
        name: 'GUESS THE NAME!!',
        description:
            'GUESS THE NAME OF COMPANY/BRAND USING GIVEN COLORS.\nby @Denish-Ranpariya',
        number: '1',
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => FindTheThing1HomeScreen()));
        },
      ),
      ActionCard(
        name: 'FIND THE ODD ONE!!',
        description:
            'FIND THE THING THAT IS DIFFERENT FROM OTHERS.\nby @Denish-Ranpariya',
        number: '2',
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => FindTheThing2HomeScreen()));
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
      title: 'FIND THE THING',
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

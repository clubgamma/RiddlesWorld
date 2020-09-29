import 'package:flutter/material.dart';
import 'package:riddleworld/categories/Game/game1/Game1homepage.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class GameLists extends StatefulWidget {
  @override
  _StateGameLists createState() => _StateGameLists();
}

class _StateGameLists extends State<GameLists> {
  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'GameLists',
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            CategoryCard(
                icon: Icons.group,
                //    color: Colors.yellow,
                name: 'GUESS THE COLOR',
                description: '''YOU WILL BE GIVEN RGB COLOR CODE AND YOU HAVE TO CHOOSE COLOR ''',
                number: '1',
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => FirstGame()));
                }),
            CategoryCard(
                icon: Icons.group,
                //    color: Colors.yellow,
                name: 'GAME 2',
                description: '''IT'S ALL ABOUT GAME2 ''',
                number: '2',
                onPressed: () {
                  // Navigator.push(context,
                  //     new MaterialPageRoute(builder: (context) => TeamPage()));
                }),
          ],
        )),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String name;
  final String number;
  final String description;

  const CategoryCard(
      {Key key,
      this.onPressed,
      this.icon,
      this.name,
      this.number,
      this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 9, bottom: 6),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(8),
          // alignment: Alignment.center,
            decoration:
                BoxDecoration(border: Border.all(width: 2), color: Colors.transparent),
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.topLeft,
                          child: ListTile(
                leading: Text(number,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                title: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(description, style: TextStyle(
                  fontSize: 12
                ),),
              ),
            )),
      ),
    );
  }
}

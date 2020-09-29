import 'package:flutter/material.dart';
import 'package:riddleworld/categories/Game/ListOfGames.dart';
import 'package:riddleworld/categories/Math/MathRiddlelLists.dart';

class Categories extends StatefulWidget {
  @override
  _StateCategories createState() => _StateCategories();
}

class _StateCategories extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CATEGORIES', style: TextStyle(
        fontWeight: FontWeight.w500,
      ),),
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            CategoryCard(
                icon: Icons.group,
                //    color: Colors.yellow,
                name: 'MATH',
                description: '''IT'S ALL ABOUT MATHS ''',
                number: '1',
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MathRiddles()));
                }),
            CategoryCard(
                icon: Icons.group,
                //    color: Colors.yellow,
                name: 'WORDS',
                description: '''IT'S ALL ABOUT WORDS ''',
                number: '2',
                onPressed: () {
                  // Navigator.push(context,
                  //     new MaterialPageRoute(builder: (context) => TeamPage()));
                }),
            CategoryCard(
                icon: Icons.group,
                //    color: Colors.yellow,
                name: 'PUZZLES',
                description: '''IT'S ALL ABOUT PUZZLES ''',
                number: '3',
                onPressed: () {
                  // Navigator.push(context,
                  //     new MaterialPageRoute(builder: (context) => TeamPage()));
                }),
            CategoryCard(
                icon: Icons.group,
                //    color: Colors.yellow,
                name: 'GAMES',
                description: '''IT'S ALL ABOUT GAMES ''',
                number: '3',
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => GameLists()));
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
              decoration: BoxDecoration(
                  border: Border.all(width: 1.6), color: Colors.transparent),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.3,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )))),
    );
  }
}



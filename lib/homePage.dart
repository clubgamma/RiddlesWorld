import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/categories/Game/ListOfGames.dart';
import 'package:riddleworld/categories/Math/MathRiddlelLists.dart';
import 'package:riddleworld/main.dart';

class Categories extends StatefulWidget {
  @override
  _StateCategories createState() => _StateCategories();
}

class _StateCategories extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'CATEGORIES',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
              width: 71,
              padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/settingPage');
                  },
                  child: Icon(
                    Icons.settings,
                    color: Provider.of<AppStateNotifier>(context, listen: true)
                            .isDarkMode
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
          ],
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            CategoryCard(
                name: 'MATH',
                icon: 'assets/icons/math_icon.svg',
                onPressed: () {
                  Navigator.pushNamed(context, '/mathPage');
                }),
            CategoryCard(
                name: 'WORDS',
                icon: 'assets/icons/words_icon.svg',
                onPressed: () {
                  Navigator.pushNamed(context, '/wordPage');
                }),
            CategoryCard(
                name: 'PUZZLES',
                icon: 'assets/icons/puzzle_icon.svg',
                onPressed: () {
                  Navigator.pushNamed(context, '/puzzlePage');
                }),
            CategoryCard(
                name: 'GAMES',
                icon: 'assets/icons/games_icon.svg',
                onPressed: () {
                  Navigator.pushNamed(context, '/gamePage');
                }),
            CategoryCard(
                name: 'WHAT SONG',
                icon: 'assets/icons/music_icon.svg',
                onPressed: () {
                  Navigator.pushNamed(context, '/whatSongPage');
                }),
            CategoryCard(
                name: 'FIND \nTHE THINGS',
                icon: 'assets/icons/things_icon.svg',
                onPressed: () {
                  Navigator.pushNamed(context, '/findThingPage');
                }),
          ],
        ));
  }
}

class CategoryCard extends StatelessWidget {
  final Function onPressed;
  final String icon;
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
                  border: Border.all(
                      width: 2,
                      color:
                          Provider.of<AppStateNotifier>(context, listen: true)
                                  .isDarkMode
                              ? Colors.white
                              : Colors.black),
                  color: Colors.transparent),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    height: 40.0,
                    width: 40.0,
                    color: Provider.of<AppStateNotifier>(context, listen: true)
                            .isDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ],
              ))),
    );
  }
}

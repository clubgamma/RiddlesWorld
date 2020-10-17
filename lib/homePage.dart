import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/core/theme_provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Categories extends StatefulWidget {
  @override
  _StateCategories createState() => _StateCategories();
}

class _StateCategories extends State<Categories> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<CategoryCard> cardList = [
      CategoryCard(
        name: 'MATH',
        icon: 'assets/icons/math_icon.svg',
        onPressed: () {
          onPlayAudio();
          Navigator.pushNamed(context, '/mathPage');
        },
      ),
      CategoryCard(
        name: 'WORDS',
        icon: 'assets/icons/words_icon.svg',
        onPressed: () {
          onPlayAudio();
          Navigator.pushNamed(context, '/wordPage');
        },
      ),
      CategoryCard(
        name: 'PUZZLES',
        icon: 'assets/icons/puzzle_icon.svg',
        onPressed: () {
          onPlayAudio();
          Navigator.pushNamed(context, '/puzzlePage');
        },
      ),
      CategoryCard(
        name: 'GAMES',
        icon: 'assets/icons/games_icon.svg',
        onPressed: () {
          onPlayAudio();
          Navigator.pushNamed(context, '/gamePage');
        },
      ),
      CategoryCard(
        name: 'WHAT SONG',
        icon: 'assets/icons/music_icon.svg',
        onPressed: () {
          onPlayAudio();
          Navigator.pushNamed(context, '/whatSongPage');
        },
      ),
      CategoryCard(
        name: 'FIND \nTHE THINGS',
        icon: 'assets/icons/things_icon.svg',
        onPressed: () {
          onPlayAudio();
          Navigator.pushNamed(context, '/findThingPage');
        },
      ),
    ];

    for (int i = 0; i < cardList.length; i++) {
      _listItems.add(cardList[i]);
    }
  }

  void onPlayAudio() async {
    AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio('assets/audios/click1.mp3'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    int columnCount = 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CATEGORIES',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(themeChange.darkMode ? Icons.brightness_2_rounded : Icons.wb_sunny_rounded),
            onPressed: () {
              themeChange.darkMode = !themeChange.darkMode;
            },
          )
        ],
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: columnCount,
          children: List.generate(
            _listItems.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 1000),
                columnCount: columnCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: _listItems[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
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
                  border: Border.all(width: 2), color: Colors.transparent),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    color: Theme.of(context).accentColor,
                    height: 40.0,
                    width: 40.0,
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

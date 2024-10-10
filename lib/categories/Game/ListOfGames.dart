import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riddleworld/categories/Game/game1@harshptl14/Game1homepage.dart';
import 'package:riddleworld/categories/Game/game2@tanharpatel/Games2HomeScreen.dart';
import 'package:riddleworld/categories/Puzzle/wordle@hassanteslim007/wordle.dart';
import 'package:riddleworld/universal/actionCard.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';

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
          onPlayAudio();
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => FirstGame()));
        },
      ),
      ActionCard(
        name: 'HELLOOOOO',
        description: '''OCTOCAT WELCOMES YOU...\nby @tanharpatel''',
        number: '2',
        onPressed: () {
          onPlayAudio();
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => Games2HomeScreen()));
        },
      ),
      ActionCard(
        name: 'WORDLE',
        description:
            '''GUESS THE CORRECT WORD BEFORE YOUR TRIALS RUN OUT\nby @hassanteslim007''',
        number: '3',
        onPressed: () {
          onPlayAudio();
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Wordle()));
        },
      ),
    ];

    for (int i = 0; i < cardList.length; i++) {
      _listItems.add(cardList[i]);
    }
  }

  void onPlayAudio() async {
    AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
    Provider.of<AppStateNotifier>(context, listen: false).isMute
        ? print('muted')
        : assetsAudioPlayer.open(
            Audio('assets/audios/click.mp3'),
          );
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

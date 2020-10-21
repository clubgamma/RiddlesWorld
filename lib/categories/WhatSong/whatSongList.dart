import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riddleworld/categories/WhatSong/WhatSong1@maplerichie/WhatSong1HomePage.dart';
import 'package:riddleworld/universal/actionCard.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';

class WhatSongList extends StatefulWidget {
  @override
  _StateWhatSongList createState() => _StateWhatSongList();
}

class _StateWhatSongList extends State<WhatSongList> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<ActionCard> cardList = [
      ActionCard(
        name: 'GUESS IT!',
        description: '''Nice lyrics make a song beautiful\nby @maplerichie''',
        number: '1',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => WhatSong1HomePage()));
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
      title: 'WHAT SONG',
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

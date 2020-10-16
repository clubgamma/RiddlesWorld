import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riddleworld/categories/Math/math1@jerry2501/math1HomePage.dart';
import 'package:riddleworld/categories/Math/math5@shobhit907/math5@HomePage.dart';
import 'package:riddleworld/categories/Math/math6@Denish-Ranpariya/math6@HomePage.dart';
import 'package:riddleworld/categories/Math/math7@MoyinShabi/math7@HomePage.dart';
import 'package:riddleworld/categories/Math/math8@c0decreat0r/math8HomePage.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'math12@Test-User-0123/math12HomePage.dart';
import 'math13@AdityaLalwani/math13HomePage.dart';
import 'math9@razorcalhn/math9HomePage.dart';
import 'math10@bibekpanda55/math10HomePage.dart';
import 'math2@Stephen-Odumirin/math2HomePage.dart';
import 'math3@madhavtripathi05/math3HomePage.dart';
import 'math4@sdmmssa/math4HomePage.dart';
import 'math11@mayankparida/math11HomePage.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MathRiddles extends StatefulWidget {
  @override
  _StateMathRiddles createState() => _StateMathRiddles();
}

class _StateMathRiddles extends State<MathRiddles> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<ActionCard> cardList = [
      ActionCard(
        name: 'FUNNY SUBTRACTION',
        description: 'A MATH RIDDLE THAT WILL BLOW YOUR MIND!!\nby @jerry2501',
        number: '1',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math1HomeScreen()));
        },
      ),
      ActionCard(
        name: 'SIMPLE BUT TRICKY DIVISION',
        description:
            'A Math riddle that might trick you if not careful \nby @Stephen-Odumirin',
        number: '2',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math2HomeScreen()));
        },
      ),
      ActionCard(
        name: 'BRAIN TEASER',
        description:
            'A MATH RIDDLE THAT WILL TAKE A MINUTE OR 2 TO FIGURE OUT!!\nby @madhavtripathi05',
        number: '3',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math3HomeScreen()));
        },
      ),
      ActionCard(
        name: 'ALGE NUMBERS',
        description:
            'A math riddle that requires you to think about letters and numbers\nby @sdmmssa',
        number: '4',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math4HomeScreen()));
        },
      ),
      ActionCard(
        name: 'OBSERVE & COUNT',
        description:
            'A MATH RIDDLE TO WHICH OBSERVATION GIVES THE COUNT\nby @shobhit907',
        number: '5',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math5HomeScreen()));
        },
      ),
      ActionCard(
        name: 'GREATEST BINARY',
        description:
            'A MATH RIDDLE TO FIND GREATEST BINARY NUMBER\nby @Denish-Ranpariya',
        number: '6',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math6HomeScreen()));
        },
      ),
      ActionCard(
        name: 'NUMBER OF TICKETS',
        description: 'A MATH BRAIN TEASER\nby @MoyinShabi',
        number: '7',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math7HomeScreen()));
        },
      ),
      ActionCard(
        name: 'ODD <-> EVEN',
        description: 'Odd Even conversion\nby @c0decreat0r',
        number: '8',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math8HomeScreen()));
        },
      ),
      ActionCard(
        name: 'WRONG BUT RIGHT',
        description:
            'THINK A LITTLE OUT OF THE BOX FOR THIS ONE\nby @razorcalhn',
        number: '9',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math9HomeScreen()));
        },
      ),
      ActionCard(
        name: 'Magic Number',
        description:
            'A math riddle which is very fun to try out by @bibekpanda55',
        number: '10',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math10HomeScreen()));
        },
      ),
      ActionCard(
        name: 'Card Skills',
        description: 'A math riddle based on the card deck by @mayankparida',
        number: '11',
        onPressed: () {
          onPlayAudio();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Math11HomeScreen()));
        },
      ),
      ActionCard(
          name: 'SEARCHING FOR THE SYMBOL',
          description: 'A math riddle based on the symbols @Test-User-0123',
          number: '12',
          onPressed: () {
            onPlayAudio();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Math12HomeScreen()));
          }),
      ActionCard(
          name: 'Time Tricks',
          description: 'A math riddle based on the time by @AdityaLalwani',
          number: '13',
          onPressed: () {
            onPlayAudio();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Math13HomeScreen()));
          }),
    ];

    for (int i = 0; i < cardList.length; i++) {
      _listItems.add(cardList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'MATH RIDDLES',
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

  void onPlayAudio() async {
    AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio('assets/audios/click.mp3'),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String name;
  final String number;
  final String description;

  const ActionCard(
      {Key key,
      @required this.onPressed,
      this.icon,
      @required this.name,
      @required this.number,
      @required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 9, bottom: 6),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              border: Border.all(width: 2), color: Colors.transparent),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                child: Center(
                  child: Text(
                    number,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class Preference extends StatefulWidget {
  @override
  _StatePreference createState() => _StatePreference();
}

class _StatePreference extends State<Preference> {
  List<Widget> _listItems = <Widget>[];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<ActionCard> cardList = [
      ActionCard(
        name: 'TOOGLE THEME',
        onPressed: () {
          Provider.of<AppStateNotifier>(context, listen: false).invertTheme();
        },
      ),
      ActionCard(
        name: 'TOOGLE AUDIO',
        onPressed: () {
          Provider.of<AppStateNotifier>(context, listen: false).invertAudio();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Provider.of<AppStateNotifier>(context, listen: false).isMute
                    ? Text('Unmuted')
                    : Text('Muted'),
            duration: Duration(seconds: 2),
          ));
        },
      ),
      ActionCard(
        name: 'CONTRIBUTORS',
        onPressed: () {
          Navigator.pushNamed(context, '/preference/contributors');
        },
      ),
      ActionCard(
        name: 'ABOUT',
        onPressed: () {
          print("contributors");
        },
      ),
    ];

    for (int i = 0; i < cardList.length; i++) {
      _listItems.add(cardList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: RiddleBar(
          title: 'PREFERENCE',
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
        ));
  }
}

class ActionCard extends StatelessWidget {
  final Function() onPressed;
  final IconData? icon;
  final String name;
  // final String description;

  const ActionCard({
    required this.onPressed,
    this.icon,
    required this.name,
    // @required this.description
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 9, bottom: 6),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: Provider.of<AppStateNotifier>(context, listen: true)
                          .isDarkMode
                      ? Colors.white
                      : Colors.black),
              color: Colors.transparent),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

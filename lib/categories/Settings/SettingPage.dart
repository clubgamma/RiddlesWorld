import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/categories/Game/game1@harshptl14/Game1homepage.dart';
import 'package:riddleworld/main.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class SettingPage extends StatefulWidget {
  @override
  _StateSettingPage createState() => _StateSettingPage();
}

class _StateSettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'SETTINGS',
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 170),
              child: Provider.of<AppStateNotifier>(context, listen: false)
                      .isDarkMode
                  ? ActionCard(
                      key: ValueKey("darkModeTrue"),
                      name: 'TOGGLE TO LIGHT THEME',
                      // description:
                      //     '''YOU WILL BE GIVEN RGB COLOR CODE AND YOU HAVE TO GUESS COLOR\n by @harshptl14''',
                      onPressed: () {
                        Provider.of<AppStateNotifier>(context, listen: false)
                            .invertTheme();
                        setState(() {});
                        // Navigator.push(context,
                        //     new MaterialPageRoute(builder: (context) => FirstGame()));
                      })
                  : ActionCard(
                      key: ValueKey("darkModeFalse"),
                      name: 'TOGGLE TO DARK THEME',
                      // description:
                      //     '''YOU WILL BE GIVEN RGB COLOR CODE AND YOU HAVE TO GUESS COLOR\n by @harshptl14''',
                      onPressed: () {
                        Provider.of<AppStateNotifier>(context, listen: false)
                            .invertTheme();
                        setState(() {});
                        // Navigator.push(context,
                        //     new MaterialPageRoute(builder: (context) => FirstGame()));
                      }),
            ),
          ],
        )),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String name;
  // final String description;

  const ActionCard({
    Key key,
    @required this.onPressed,
    this.icon,
    @required this.name,
    // @required this.description
  }) : super(key: key);
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

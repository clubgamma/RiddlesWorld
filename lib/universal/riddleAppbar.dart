import 'package:flutter/material.dart';

class RiddleBar extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget tabBar;
  final bool cross;

  const RiddleBar(
      {Key key,
      @required this.body,
      @required this.title,
      this.tabBar,
      this.cross})
      : super(key: key);

  @override
  _RiddleBarState createState() => _RiddleBarState();
}

class _RiddleBarState extends State<RiddleBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            bottom: widget.tabBar != null ? widget.tabBar : null,
            leading:InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                )),
            actions: <Widget>[
              // IconButton(
              //   icon: Icon(
              //     ConfigBloc().darkModeOn
              //         ? FontAwesomeIcons.lightbulb
              //         : FontAwesomeIcons.solidLightbulb,
              //     size: 18,
              //   ),
              //   onPressed: () {
              //     ConfigBloc()
              //         .dispatch(DarkModeEvent(!ConfigBloc().darkModeOn));
              //   },
              // ),
              // IconButton(
              //   onPressed: () => Share.share(
              //       "Download the new ClubGamma App and share with your friends- " + "https://play.google.com/store/apps/details?id=" + 'com.gce.clubgamma' +"\n\n"),
              //   icon: Icon(
              //     Icons.share,
              //     size: 20,
              //   ),
              // ),
              // widget.settingsIcon == true
              //     ? IconButton(
              //         onPressed: () {
              //           return _onButtonPressed();
              //         },
              //         icon: Icon(
              //           Icons.format_list_bulleted,
              //           size: 20,
              //         ),
              //       )
              //     : Container(),
            ],
          ),
          body: widget.body,
        ),
      ),
    );
  }
}

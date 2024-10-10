import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Contributors extends StatefulWidget {
  @override
  _StateContributors createState() => _StateContributors();
}

class _StateContributors extends State<Contributors> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<List<String>> contributorName = [
      ["Harsh Patel", "harshptl14", "https://github.com/harshptl14"],
      ["Rudra Barad", "rudrabarad", "https://github.com/rudrabarad"],
      ["Tanha Patel", "tanharpatel", "https://github.com/tanharpatel"],
      [
        "Denish Ranpariya",
        "Denish-Ranpariya",
        "https://github.com/Denish-Ranpariya"
      ],
      ["c0decreat0r", "c0decreat0r", "https://github.com/c0decreat0r"],
      ["Ashutosh", "xyther14", "https://github.com/xyther14"],
      ["Vaibhav Andhare", "vaandhare", "https://github.com/vaandhare"],
      ["Smit Patel", "smit4297", "https://github.com/smit4297"],
      ["Shobhit Gupta", "shobhit907", "https://github.com/shobhit907"],
      ["", "sdmmssa", "https://github.com/sdmmssa"],
      ["Md Zaid Ansari", "razorcalhn", "https://github.com/razorcalhn"],
      ["Mayank Parida", "mayankparida", "https://github.com/mayankparida"],
      ["Marc", "march93", "https://github.com/march93"],
      ["LikKee Richie", "maplerichie", "https://github.com/maplerichie"],
      [
        "Madhav tripathi",
        "madhavtripathi05",
        "https://github.com/madhavtripathi05"
      ],
      ["Jignesh Kukadiya", "jerry2501", "https://github.com/jerry2501"],
      ["Chirayu Joshi", "chirayu-joshi", "https://github.com/chirayu-joshi"],
      ["Bibek Panda", "bibekpanda55", "https://github.com/bibekpanda55"],
      ["Clone Account", "Test-user-0123", "https://github.com/Test-user-0123"],
      [
        "Stephen Odumirin",
        "Stephen-Odumirin",
        "https://github.com/Stephen-Odumirin"
      ],
      ["Sayuti", "Sayutizxc", "https://github.com/Sayutizxc"],
      ["Moyin Shabi", "MoyinShabi", "https://github.com/MoyinShabi"],
      ["Aditya Lalwani", "AdityaLalwani", "https://github.com/AdityaLalwani"],
      ["Hassan Teslim", "HassanTeslim007", "https://github.com/hassanteslim007"]
    ];

    for (int i = 0; i < contributorName.length; i++) {
      _listItems.add(ActionCard(
        name: contributorName[i][0],
        id: contributorName[i][1],
        url: contributorName[i][2],
        onPressed: () {
          print(contributorName[i].toString());
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'CONTRIBUTORS',
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

class ActionCard extends StatelessWidget {
  final Function() onPressed;
  final IconData? icon;
  final String name;
  final String id;
  final String? url;

  const ActionCard(
      {super.key,
      required this.onPressed,
      this.icon,
      required this.name,
      required this.id,
      this.url});

  _launchURL() async {
    ;
    if (await canLaunchUrl(Uri.https('github.com', url!.split('/').last))) {
      await launchUrl(Uri.https('github.com', url!.split('/').last));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 9, bottom: 6),
      child: InkWell(
        onTap: () => _launchURL(),
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
                  Container(
                    child: Text(
                      id,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
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

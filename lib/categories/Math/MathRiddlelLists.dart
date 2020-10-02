import 'package:flutter/material.dart';
import 'package:riddleworld/categories/Math/math1@jerry2501/math1HomePage.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

import 'math2@Stephen-Odumirin/math2HomePage.dart';

class MathRiddles extends StatefulWidget {
  @override
  _StateMathRiddles createState() => _StateMathRiddles();
}

class _StateMathRiddles extends State<MathRiddles> {
  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'MATH RIDDLES',
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ActionCard(
                  name: 'FUNNY SUBTRACTION',
                  description:
                      'A MATH RIDDLE THAT WILL BLOW YOUR MIND!!\nby @jerry2501',
                  number: '1',
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => Math1HomeScreen()));
                  }),
              ActionCard(
                name: 'SIMPLE BUT TRICKY DIVISION',
                description:
                    'A Math riddle that might trick you if not careful \n by @Stephen-Odumirin',
                number: '2',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => Math2HomeScreen()));
                },
              ),
            ],
          ),
        ),
      ),
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
                width: 10,
                child: Text(
                  number,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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

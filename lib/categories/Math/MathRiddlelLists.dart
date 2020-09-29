import 'package:flutter/material.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class MathRiddles extends StatefulWidget {
  @override
  _StateMathRiddles createState() => _StateMathRiddles();
}

class _StateMathRiddles extends State<MathRiddles> {
  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'MathRiddles',
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            CategoryCard(
                icon: Icons.group,
                //    color: Colors.yellow,
                name: 'RIDDLE 1',
                description: 'PLACEHOLDER TEXT',
                number: '1',
                onPressed: () {
                  // Navigator.push(context,
                  //     new MaterialPageRoute(builder: (context) => TeamPage()));
                }),
            CategoryCard(
                icon: Icons.group,
                //    color: Colors.yellow,
                name: 'RIDDLE 2',
                description: 'PLACEHOLDER TEXT',
                number: '2',
                onPressed: () {
                  // Navigator.push(context,
                  //     new MaterialPageRoute(builder: (context) => TeamPage()));
                }),
          ],
        )),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
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
            decoration:
                BoxDecoration(border: Border.all(), color: Colors.transparent),
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: Text(number,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              title: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(description),
            )),
      ),
    );
  }
}

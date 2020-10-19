import 'package:flutter/material.dart';
import 'package:riddleworld/universal/result.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'package:provider/provider.dart';
import 'package:riddleworld/main.dart';

class Words1HomePage extends StatefulWidget {
  @override
  _Words1HomePageState createState() => _Words1HomePageState();
}

class _Words1HomePageState extends State<Words1HomePage> {
  final TextEditingController _controller = TextEditingController();
  bool _answer = false;
  int _score = 0;
  int _count = 0;
  void resetHanlder() {
    setState(() {
      _answer = false;
      _count = 0;
      _score = 0;
      _controller.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'FIND THE HIDDEN WORDS',
      body: (_answer)
          ? Result(_score, 1, resetHanlder, '/wordPage')
          : Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  (TimeOfDay.now() != TimeOfDay(hour: 00, minute: 00))
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _count++;
                            });
                          },
                          icon: Icon(Icons.brightness_3))
                      : Center(child: Text('FROM THE DARK')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Provider.of<AppStateNotifier>(context,
                                            listen: false)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                            color: Colors.transparent),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          (_count > 10) ? '00:00' : 'TAP THE MOON',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Provider.of<AppStateNotifier>(context,
                                          listen: false)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                          color: Colors.transparent),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'YOUR ANSWER',
                        ),
                        textCapitalization: TextCapitalization.characters,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Provider.of<AppStateNotifier>(context,
                                        listen: false)
                                    .isDarkMode
                                ? Colors.white
                                : Colors.black),
                        color: Colors.transparent),
                    child: FlatButton(
                      onPressed: () {
                        if (_controller.text.trim() == "FROM THE DARK") {
                          setState(() {
                            _score = 1;
                            _answer = true;
                          });
                        } else {
                          setState(() {
                            _score = 0;
                            _answer = true;
                          });
                        }
                      },
                      child: Text('SUBMIT'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

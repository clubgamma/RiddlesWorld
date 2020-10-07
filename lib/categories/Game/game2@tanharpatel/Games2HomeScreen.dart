import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Games2HomeScreen extends StatefulWidget {
  @override
  _Games2HomeScreenState createState() => _Games2HomeScreenState();
}

class _Games2HomeScreenState extends State<Games2HomeScreen> {
  AudioPlayer audio;
  bool enable = false;

  @override
  void initState() {
    audio = AudioPlayer();
    audio.setLoopMode(LoopMode.one);
    audio.setVolume(100);
    initial();
    super.initState();
  }

  initial() async {
    await audio.setAsset('assets/octocat.mp3');
  }
  
  @override
  void dispose() {
    audio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Text('Octocat Here!!!', style: TextStyle(fontSize: 20))),
            Center(child: Text('Keep media volumn on :)', style: TextStyle(fontSize: 15))),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: (){setState(() {
              enable = !enable;
              if(enable == true) {
                audio.seek(Duration(seconds: 0));
                audio.play();
              } else {
                audio.pause();
              }
            });},
            child: Container(
              child: Image.asset("assets/octocat2.jpg"),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.45,
            left: MediaQuery.of(context).size.width*0.13,
            child: ShakeAnimatedWidget(
              enabled: enable,
              duration: Duration(seconds: 2),
              shakeAngle: Rotation.deg(z: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                child: Image.asset("assets/wave.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
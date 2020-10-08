import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

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
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         Center(child:
        //         Text('Octocat Here!!!', style: TextStyle(fontSize: 20))),
        //       ],
        //     ),
        //     centerTitle: true,
        //   ),
        RiddleBar(
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.6),
                          color: Colors.transparent),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'KEEP THE MEDIA VOLUME ON :)',
                            style: TextStyle(fontSize: 15),
                          ))),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      enable = !enable;
                      if (enable == true) {
                        audio.seek(Duration(seconds: 0));
                        audio.play();
                      } else {
                        audio.pause();
                      }
                    });
                  },
                  child: Container(
                    child: Image.asset("assets/octocat2.jpg"),
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.45,
                  left: MediaQuery.of(context).size.width * 0.13,
                  child: ShakeAnimatedWidget(
                    enabled: enable,
                    duration: Duration(seconds: 2),
                    shakeAngle: Rotation.deg(z: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image.asset("assets/wave.png"),
                    ),
                  ),
                ),
              ],
            ),
            title: 'OCTOCAT HERE!!!');

    //  );
  }
}

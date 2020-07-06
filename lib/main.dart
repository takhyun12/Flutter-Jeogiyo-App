import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

void main() {
  runApp(new MaterialApp(debugShowCheckedModeBanner: false,home:  Main()));
}

class Main extends StatefulWidget {
  @override
  _Main createState() =>  _Main();
}

class _Main extends State<Main> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: Container(
        width: 80,
        height: 40,
        child: RaisedButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(txt),
            color: Colors.lightGreen,
            textColor: Colors.white,
            onPressed: onPressed),
      ),
    );
  }

  Widget playButton(String path) {
    return _tab([
      _btn('Play', () => audioCache.play(path)),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.lightGreen,
          title: Center(child: Text('저..저기요')),
        ),

        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                IconButton(
                  icon: Icon(Icons.content_paste),
                  iconSize: 50.0,
                  color: Colors.lightGreen,
                ),

                Text(
                  '이모, 여기 주문좀 받아주세요',
                  style: TextStyle(color: Colors.black),
                ),

                Text(
                  '(I would like to order! / 注文します!)',
                  style: TextStyle(color: Colors.grey),
                ),

                playButton('order.mp3'),

                IconButton(
                  icon: Icon(Icons.local_drink),
                  iconSize: 50.0,
                  color: Colors.blueAccent,
                ),

                Text(
                  '이모, 여기 물좀 주세요',
                  style: TextStyle(color: Colors.black),
                ),

                Text(
                  '(Give me some water, please. / 水をください.)',
                  style: TextStyle(color: Colors.grey),
                ),

                playButton('water.mp3'),


              ]
          ),
        ),

      ),
    );
  }
}

void clickMe() {

}
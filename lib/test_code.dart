import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '저기요',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '저..저기요'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.content_paste),
                iconSize: 50.0,
                color: Colors.redAccent,
                highlightColor: Colors.deepOrangeAccent,
                onPressed: clickMe,
              ),

              Text(
                '이모, 여기 주문좀 받아주세요',
                style: TextStyle(color: Colors.black),
              ),

              Text(
                '(I would like to order! / 注文します!)',
                style: TextStyle(color: Colors.grey),
              ),


              IconButton(
                icon: Icon(Icons.local_drink),
                iconSize: 50.0,
                color: Colors.blueAccent,
                highlightColor: Colors.lightBlueAccent,
                onPressed: clickMe2,
              ),

              Text(
                '이모, 여기 물좀 주세요',
                style: TextStyle(color: Colors.black),
              ),

              Text(
                '(Give me some water, please. / 水をください.)',
                style: TextStyle(color: Colors.grey),
              ),

              IconButton(
                icon: Icon(Icons.payment),
                iconSize: 50.0,
                color: Colors.lightGreen,
                highlightColor: Colors.lightGreenAccent,
                onPressed: clickMe2,
              ),

              Text(
                '이모, 여기 계산이요',
                style: TextStyle(color: Colors.black),
              ),

              Text(
                '(check please. / お勘定お願いします)',
                style: TextStyle(color: Colors.grey),
              ),

            ],
          ),
        )
    );
  }

  void clickMe() {


    SystemSound.play(SystemSoundType.click);
  }

  void clickMe2() {
    print('cliddddcked!');
  }

}

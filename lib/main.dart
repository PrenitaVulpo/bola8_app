import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Bola 8'),
          backgroundColor: Colors.red,
        ),
        body: BallPage(),
      ),
    ),
  );
}

class BallPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  String _sortedBall = 'ball1.png';
  String _sortedPhrase = 'Sim';
  List<String> _balls = [
    'ball1.png',
    'ball2.png',
    'ball3.png',
    'ball4.png',
    'ball5.png',
  ];
  List<String> _phrases = [
    'Sim',
    'Não',
    'Pergunte-me depois',
    'A resposta é sim',
    'Não faço ideia'
  ];

  void randomBall() {
    setState(() {
      int i = Random().nextInt(_balls.length);
      _sortedBall = sortBall(i);
      _sortedPhrase = sortPhrase(i);
    });
  }
  String sortPhrase(int i) {
    return _phrases[i];
  }
  String sortBall(int i) {
    return _balls[i];
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                randomBall();
              },
              child: Image.asset(
                'images/$_sortedBall',
              ),
            ),
          ),
          Expanded(
              child: Text(
                '$_sortedPhrase',
              ),
          ),
        ],
      ),
    );
  }
}

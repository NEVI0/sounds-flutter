import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.cyan,
    Colors.blue,
    Colors.purple
  ];

  void playAudio(int number) {
    final player = AudioCache();
    player.play('note$number.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ignore: sdk_version_ui_as_code
                for (int index = 0; index < colors.length; index++)
                  soundButton(colors[index], index + 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton soundButton(Color color, int index) {
    return TextButton(
      onPressed: () {
        playAudio(index + 1);
      },
      child: Text('Sound $index'),
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => color),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
    );
  }
}

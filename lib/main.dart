import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(child: Text('Xylophone')),
        ),
        body: const XylophoneApp(),
      ),
    ),
  );
}


class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void setSound(int keyNumber) async{
    final player = AudioPlayer();
    await player.play(AssetSource('note$keyNumber.wav'));
  }

  Expanded buildKey({required Color color, required int soundNumber}){
    return Expanded(
      child: TextButton(
        onPressed: () {
          setSound(soundNumber);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(color: Colors.red, soundNumber: 1),
        buildKey(color: Colors.orange, soundNumber: 2),
        buildKey(color: Colors.yellow, soundNumber: 3),
        buildKey(color: Colors.green, soundNumber: 4),
        buildKey(color: Colors.teal, soundNumber: 5),
        buildKey(color: Colors.blue, soundNumber: 6),
        buildKey(color: Colors.purple, soundNumber: 7),
      ],
    );
  }
}


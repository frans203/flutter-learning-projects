import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int sound) async {
    final player = AudioPlayer();
    await player.play(AssetSource("note$sound.wav"));
  }

  List<Expanded> buildKeys() {
    return [
      buildKey(1, Colors.red),
      buildKey(2, Colors.blue),
      buildKey(3, Colors.yellow),
      buildKey(4, Colors.green),
      buildKey(5, Colors.purple),
      buildKey(6, Colors.pink),
      buildKey(7, Colors.lightGreen),
    ];
  }

  Expanded buildKey(int keyValue, MaterialColor color) {
    return Expanded(
      child: TextButton(
        onPressed: () async {
          playSound(keyValue);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.all(20),
        ),
        child: Center(
          child: Text(
            "sound $keyValue",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildKeys()),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dice_game/screens/game_screen.dart';

void main() {
  runApp(DiceGameApp());
}

class DiceGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(),
    );
  }
}

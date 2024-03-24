import 'package:dice_game/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:dice_game/screens/game_screen.dart'; // Import your game screen here
import 'package:dice_game/screens/author_screen.dart'; // Import your author screen here
import 'package:dice_game/screens/rules_screen.dart'; // Import your rules screen here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Game',
      debugShowCheckedModeBanner: false,
      theme: DiceGameTheme.themeData,
      home: GameScreen(),
      routes: {
        '/author': (context) => AuthorScreen(),
        '/rules': (context) => RulesScreen(),
      },
    );
  }
}

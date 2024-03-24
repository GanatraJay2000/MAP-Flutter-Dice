import 'package:flutter/material.dart';

class DiceGameTheme {
  static ThemeData get themeData {
    return ThemeData(
      primarySwatch: Colors.orange,
      hintColor: Colors.orange,
      scaffoldBackgroundColor: Colors.purple[50],
      fontFamily: 'Roboto',
      textTheme: _textTheme,
    );
  }

  static TextTheme get _textTheme {
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: Colors.deepPurple),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

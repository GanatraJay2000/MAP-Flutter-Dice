import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int totalScore;
  final int currentScore;

  const ScoreDisplay({Key? key, required this.totalScore, required this.currentScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Current Score: $currentScore', style: TextStyle(fontSize: 20)),
        Text('Total Score: $totalScore', style: TextStyle(fontSize: 20)),
      ],
    );

  }
}

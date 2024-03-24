import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int totalScore;
  final int currentScore;
  final List<int> diceValues;

  const ScoreDisplay({Key? key, required this.totalScore, required this.currentScore, required this.diceValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int modifiedCurrentScore = currentScore;

    // Check if all dice have the same value
    if (diceValues.isNotEmpty && diceValues.every((value) => value == diceValues[0])) {
      // Double the current score if all dice have the same value
      modifiedCurrentScore *= 2;
    }

    return Column(
      children: [
        Text('Current Score: $modifiedCurrentScore', style: Theme.of(context).textTheme.displayMedium),
        Text('Total Score: $totalScore', style: Theme.of(context).textTheme.displayLarge),
      ],
    );
  }
}

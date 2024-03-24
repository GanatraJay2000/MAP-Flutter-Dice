import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rules'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Game Rules:',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            const Text(
              'The objective of the game is to score higher than the computer opponent over a series of 5 rounds.\n\n'
                  '- Each player starts with a score of 0.\n'
                  '- In each round, both the user and the computer roll a set number of dice.\n'
                  '- After 5 rounds, the player with the highest total score wins the game.\n'
                  '- The number of dice rolled in each round is determined by the user using the stepper control, with a range of 2 to 5 dice.\n'
                  '- The score for each player is the sum of the values rolled on the dice in each round.\n'
                  '- The scores from each round are accumulated to calculate the total score for each player.\n'
                  '- If both players have the same total score, the game ends in a tie.\n'
                  '- If all dice have the same value, the player\'s score is doubled.',
              textAlign: TextAlign.center,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

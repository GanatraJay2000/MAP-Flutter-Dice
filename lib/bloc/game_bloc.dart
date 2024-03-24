import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dice_game/widgets/alert_dialog.dart';

class GameBloc {
  late BuildContext context;
  int userScore = 0;
  int computerScore = 0;
  int roundNumber = 0;
  int numberOfDice = 2;
  List<int> userDiceValues = [];
  List<int> computerDiceValues = [];

  void setContext(BuildContext context) {
    this.context = context;
  }

  void rollDice() {
    roundNumber++;
    userDiceValues.clear();
    computerDiceValues.clear();
    for (int i = 0; i < numberOfDice; i++) {
      int userDiceValue = _rollSingleDie();
      int computerDiceValue = _rollSingleDie();
      userDiceValues.add(userDiceValue);
      computerDiceValues.add(computerDiceValue);
      userScore += userDiceValue;
      computerScore += computerDiceValue;
    }

    if (roundNumber == 5) {
      _showResultDialog();
      resetGame();
    }
  }

  int _rollSingleDie() {
    return Random().nextInt(6) + 1;
  }

  void resetGame() {
    userScore = 0;
    computerScore = 0;
    roundNumber = 0;
    userDiceValues.clear();
    computerDiceValues.clear();
  }

  void setNumberOfDice(int value) {
    numberOfDice = value;
  }

  void _showResultDialog() {
    String result;
    if (userScore > computerScore) {
      result = 'You win with a total score of $userScore!';
    } else if (userScore < computerScore) {
      result = 'Computer wins with a total score of $computerScore!';
    } else {
      result = 'It\'s a tie with a total score of $userScore!';
    }

    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'Game Over',
        content: result,
        onDismissed: () {
          resetGame();
        },
      ),
    );
  }
}

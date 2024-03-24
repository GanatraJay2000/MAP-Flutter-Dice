import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dice_game/model/game_model.dart';

import '../widgets/alert_dialog.dart';

class GameBloc {
  final _gameModel = GameModel();
  final _userScoreController = StreamController<int>.broadcast();
  final _computerScoreController = StreamController<int>.broadcast();
  final _roundNumberController = StreamController<int>.broadcast();
  final _numberOfDiceController = StreamController<int>.broadcast();
  final _userDiceValuesController = StreamController<List<int>>.broadcast();
  final _computerDiceValuesController = StreamController<List<int>>.broadcast();

  Stream<int> get userScore => _userScoreController.stream;
  Stream<int> get computerScore => _computerScoreController.stream;
  Stream<int> get roundNumber => _roundNumberController.stream;
  Stream<int> get numberOfDice => _numberOfDiceController.stream;
  Stream<List<int>> get userDiceValues => _userDiceValuesController.stream;
  Stream<List<int>> get computerDiceValues => _computerDiceValuesController.stream;

  void setContext(BuildContext context) {
    _gameModel.context = context;
  }


  void rollDice() {
    _gameModel.roundNumber++;
    _gameModel.userDiceValues.clear();
    _gameModel.computerDiceValues.clear();
    bool allSame = true; // Flag to check if all dice values are the same
    int previousValue = 0; // Store the previous dice value to compare

    for (int i = 0; i < _gameModel.numberOfDice; i++) {
      int userDiceValue = _rollSingleDie();
      int computerDiceValue = _rollSingleDie();
      _gameModel.userDiceValues.add(userDiceValue);
      _gameModel.computerDiceValues.add(computerDiceValue);
      _gameModel.userScore += userDiceValue;
      _gameModel.computerScore += computerDiceValue;

      // Check if the current dice value is the same as the previous one
      if (i > 0 && userDiceValue != previousValue) {
        allSame = false;
      }
      previousValue = userDiceValue;
    }

    // Double the user's score if all dice have the same value
    if (allSame) {
      _gameModel.userScore *= 2;
    }

    if (_gameModel.roundNumber == 5) {
      _showResultDialog();
      _resetGame();
    }

    _userScoreController.add(_gameModel.userScore);
    _computerScoreController.add(_gameModel.computerScore);
    _roundNumberController.add(_gameModel.roundNumber);
    _userDiceValuesController.add(_gameModel.userDiceValues);
    _computerDiceValuesController.add(_gameModel.computerDiceValues);
  }

  void resetTheGame() {
    showDialog(
      context: _gameModel.context,
      builder: (context) => CustomAlertDialog(
        title: 'Game Reset',
        content: "A new game will start now.",
        onDismissed: () {},
      ),
    );
    _resetGame();
  }


  void _resetGame() {
    _gameModel.userScore = 0;
    _gameModel.computerScore = 0;
    _gameModel.roundNumber = 0;
    _gameModel.userDiceValues.clear();
    _gameModel.computerDiceValues.clear();
  }

  void setNumberOfDice(int value) {
    _gameModel.numberOfDice = value;
    _numberOfDiceController.add(_gameModel.numberOfDice);
  }

  void dispose() {
    _userScoreController.close();
    _computerScoreController.close();
    _roundNumberController.close();
    _numberOfDiceController.close();
    _userDiceValuesController.close();
    _computerDiceValuesController.close();
  }

  int _rollSingleDie() {
    return Random().nextInt(6) + 1;
  }

  void _showResultDialog() {
    String result;
    if (_gameModel.userScore > _gameModel.computerScore) {
      result = 'You win with a total score of ${_gameModel.userScore!}';
    } else if (_gameModel.userScore < _gameModel.computerScore) {
      result = 'Computer wins with a total score of ${_gameModel.computerScore!}';
    } else {
      result = 'It\'s a tie with a total score of ${_gameModel.userScore!}';
    }

    showDialog(
      context: _gameModel.context,
      builder: (context) => CustomAlertDialog(
        title: 'Game Over',
        content: result,
        onDismissed: () {
          _resetGame();
        },
      ),
    );
  }
}
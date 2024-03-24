import 'package:flutter/material.dart';
import 'package:dice_game/widgets/dice_display.dart';
import 'package:dice_game/widgets/score_display.dart';
import 'package:dice_game/widgets/custom_button.dart';
import 'package:dice_game/widgets/dice_number_slider.dart';
import 'package:dice_game/bloc/game_bloc.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameBloc _gameBloc = GameBloc();

  @override
  Widget build(BuildContext context) {
    _gameBloc.setContext(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Player', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    DiceDisplay(diceValues: _gameBloc.userDiceValues),
                    SizedBox(height: 10),
                    ScoreDisplay(
                      totalScore: _gameBloc.userScore,
                      currentScore: _gameBloc.userDiceValues.isEmpty ? 0 : _gameBloc.userDiceValues.reduce((a, b) => a + b),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Computer', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    DiceDisplay(diceValues: _gameBloc.computerDiceValues),
                    SizedBox(height: 10),
                    ScoreDisplay(
                        totalScore: _gameBloc.computerScore,
                        currentScore: _gameBloc.computerDiceValues.isEmpty ? 0 : _gameBloc.computerDiceValues.reduce((a, b) => a + b)
                    ),
                  ],
                ),
              ],
            ),

            CustomButton(
              text: 'Roll Dice',
              onPressed: () {
                setState(() {
                  _gameBloc.rollDice();
                });
              },
            ),
            CustomButton(
              text: 'Reset Game',
              onPressed: () {
                setState(() {
                  _gameBloc.resetGame();
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Number of Dice ${_gameBloc.numberOfDice}', style: TextStyle(fontSize: 20)),
                DiceNumberSlider(
                  value: _gameBloc.numberOfDice,
                  onChanged: (value) {
                    setState(() {
                      _gameBloc.setNumberOfDice(value as int);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

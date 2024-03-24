import 'package:dice_game/screens/author_screen.dart';
import 'package:dice_game/screens/rules_screen.dart';
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
  void dispose() {
    _gameBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _gameBloc.setContext(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RulesScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthorScreen()),
              );
            },
          ),
        ],
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
                    StreamBuilder<List<int>>(
                      stream: _gameBloc.userDiceValues,
                      builder: (context, snapshot) {
                        return DiceDisplay(diceValues: snapshot.data ?? []);
                      },
                    ),
                    SizedBox(height: 10),
                    StreamBuilder<int>(
                      stream: _gameBloc.userScore,
                      builder: (context, snapshot) {
                        return StreamBuilder<List<int>>(
                          stream: _gameBloc.userDiceValues,
                          builder: (context, diceSnapshot) {
                            return ScoreDisplay(
                              totalScore: snapshot.data ?? 0,
                              currentScore: diceSnapshot.data?.isEmpty ?? true ? 0 : diceSnapshot.data!.reduce((a, b) => a + b,),
                              diceValues: diceSnapshot.data ?? [],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Computer', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    StreamBuilder<List<int>>(
                      stream: _gameBloc.computerDiceValues,
                      builder: (context, snapshot) {
                        return DiceDisplay(diceValues: snapshot.data ?? []);
                      },
                    ),
                    SizedBox(height: 10),
                    StreamBuilder<int>(
                      stream: _gameBloc.computerScore,
                      builder: (context, snapshot) {
                        return StreamBuilder<List<int>>(
                          stream: _gameBloc.computerDiceValues,
                          builder: (context, diceSnapshot) {
                            return ScoreDisplay(
                              totalScore: snapshot.data ?? 0,
                              currentScore: diceSnapshot.data?.isEmpty ?? true ? 0 : diceSnapshot.data!.reduce((a, b) => a + b),
                              diceValues: diceSnapshot.data ?? [],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            CustomButton(
              text: 'Roll Dice',
              onPressed: () {
                _gameBloc.rollDice();
              },
            ),
            CustomButton(
              text: 'Reset Game',
              onPressed: () {
                _gameBloc.resetTheGame();
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StreamBuilder<int>(
                  stream: _gameBloc.numberOfDice,
                  builder: (context, snapshot) {
                    return Text('Number of Dice ${snapshot.data ?? 2}', style: TextStyle(fontSize: 20));
                  },
                ),
                StreamBuilder<int>(
                  stream: _gameBloc.numberOfDice,
                  builder: (context, snapshot) {
                    return DiceNumberSlider(
                      value: snapshot.data ?? 2,
                      onChanged: (value) {
                        _gameBloc.setNumberOfDice(value.toInt());
                      },
                    );
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
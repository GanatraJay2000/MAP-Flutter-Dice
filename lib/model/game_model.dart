import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dice_game/widgets/alert_dialog.dart';

class GameModel {
  late BuildContext context;
  int userScore = 0;
  int computerScore = 0;
  int roundNumber = 0;
  int numberOfDice = 2;
  List<int> userDiceValues = [];
  List<int> computerDiceValues = [];
}

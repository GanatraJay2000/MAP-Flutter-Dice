import 'dart:math';

class GameModel {
  int score = 0;
  int roundNumber = 0;
  List<int> diceValues = [];
  int numberOfDice = 2; // Default number of dice

  void rollDice() {
    roundNumber++;
    // Roll dice for user
    diceValues.clear();
    for (int i = 0; i < numberOfDice; i++) {
      int diceValue = _rollSingleDie();
      diceValues.add(diceValue);
      score += diceValue;
    }
    // Roll dice for computer (for demonstration purpose, you can replace this logic)
    for (int i = 0; i < numberOfDice; i++) {
      int diceValue = _rollSingleDie();
      score -= diceValue;
    }
  }

  int _rollSingleDie() {
    return Random().nextInt(6) + 1;
  }

  void resetGame() {
    score = 0;
    roundNumber = 0;
    diceValues.clear();
  }

  void setNumberOfDice(int value) {
    numberOfDice = value;
    resetGame();
  }
}

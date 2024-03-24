import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DiceDisplay extends StatelessWidget {
  final List<int> diceValues;

  const DiceDisplay({Key? key, required this.diceValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        diceValues.length,
            (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/dice/Dice${diceValues[index]}.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}

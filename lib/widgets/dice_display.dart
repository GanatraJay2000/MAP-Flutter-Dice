import 'package:flutter/material.dart';
import 'dart:math';

class DiceDisplay extends StatefulWidget {
  final List<int> diceValues;

  const DiceDisplay({Key? key, required this.diceValues}) : super(key: key);

  @override
  _DiceDisplayState createState() => _DiceDisplayState();
}

class _DiceDisplayState extends State<DiceDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late List<int> _previousDiceValues;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _previousDiceValues = List.from(widget.diceValues);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DiceDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.diceValues != _previousDiceValues) {
      _animateDiceRoll();
    }
  }

  void _animateDiceRoll() {
    _controller.reset();
    _controller.forward();
    setState(() {
      _previousDiceValues = List.from(widget.diceValues);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.diceValues.length,
            (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * pi * 2,
                child: child,
              );
            },
            child:
                Image.asset(
                  'assets/images/dice/Dice${widget.diceValues[index]}.png',
                  width: 50,
                  height: 50,
                ),

            ),
              const SizedBox(width: 10),
              Text(
                '${widget.diceValues[index]}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

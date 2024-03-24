import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DiceNumberSlider extends StatelessWidget {
  final int value;
  final ValueChanged<double> onChanged;

  const DiceNumberSlider({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoSlider(
        value: value.toDouble(),
        min: 2,
        max: 5,
        divisions: 3,
        onChanged: onChanged,
      );
    } else {
      return Slider(
        value: value.toDouble(),
        min: 2,
        max: 5,
        divisions: 3,
        label: value.toString(),
        onChanged: onChanged,
      );
    }
  }
}

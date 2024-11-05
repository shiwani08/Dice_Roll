import 'package:flutter/material.dart';
import 'package:dice_roll/change-dice.dart';

class RollDice extends StatelessWidget {
  RollDice({super.key});

  var changeNum = 'assets/images/dice-1.png';

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(100, 213, 163, 207),
            Color.fromARGB(100, 00, 100, 150),
          ],
        ),
      ),
      child: const ChangeDice(),
    );
  }
}

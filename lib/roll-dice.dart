import 'package:flutter/material.dart';
import 'package:dice_roll/SevenUpDown.dart';

class RollDice extends StatelessWidget {
  const RollDice({super.key});

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
      child: const SevenUpSevenDown(),
    );
  }
}

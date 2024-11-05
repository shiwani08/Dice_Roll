import 'package:flutter/material.dart';
import 'dart:math';

class ChangeDice extends StatefulWidget {
  const ChangeDice({super.key});

  @override
  State createState() {
    return _ChangeDiceState();
  }
}

class _ChangeDiceState extends State<ChangeDice> {
  // Variable to hold the path to the dice image
  var changeNum = 'assets/images/dice-1.png';

  // Click function to change the dice image and trigger a rebuild
  void click() {
    var diceRoll = Random().nextInt(6) + 1; // Generates a random number from 1 to 6
    setState(() {
      changeNum = 'assets/images/dice-$diceRoll.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          // added animation here
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Image.asset(
              changeNum,  // Use changeNum to dynamically show the dice image
              key: ValueKey<String>(changeNum),  // Unique key to track image changes
              width: 120,
            ),
          ),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: click, // Passing a pointer to the click function
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.purple,
            textStyle: const TextStyle(
              fontSize: 40,
            ),
          ),
          child: const Text(
            'Roll',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

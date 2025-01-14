import 'package:flutter/material.dart';
import 'dart:math';

class SevenUpSevenDown extends StatefulWidget {
  const SevenUpSevenDown({super.key});

  @override
  SevenUpSevenDownState createState() => SevenUpSevenDownState();
}

class SevenUpSevenDownState extends State<SevenUpSevenDown> {
  String playerChoice = '';
  int score = 0;
  String resultMessage = '';
  int currentDice1 = 1; // Track the dice values
  int currentDice2 = 1;

  @override
  void initState() {
    super.initState();
  }

  void rollDice() {
    setState(() {
      resultMessage = ''; // Clear the result message while rolling
    });

    // Simulate rolling animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        currentDice1 = Random().nextInt(6) + 1;
        currentDice2 = Random().nextInt(6) + 1;

        var sum = currentDice1 + currentDice2;

        // Determine result
        if ((sum > 7 && playerChoice == '7 Up') ||
            (sum < 7 && playerChoice == '7 Down') ||
            (sum == 7 && playerChoice == '7 Exact')) {
          resultMessage = 'You Win!';
          score++;
        } else {
          resultMessage = 'You Lose!';
        }
      });
    });
  }

  void setChoice(String choice) {
    setState(() {
      playerChoice = choice;
      resultMessage = '';
    });
    rollDice();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated dice
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: animation,
                  child: child,
                ),
                child: Image.asset(
                  'assets/images/dice-$currentDice1.png',
                  key: ValueKey<int>(currentDice1), // Unique key for animation
                  width: 100,
                ),
              ),
              const SizedBox(width: 10),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: animation,
                  child: child,
                ),
                child: Image.asset(
                  'assets/images/dice-$currentDice2.png',
                  key: ValueKey<int>(currentDice2), // Unique key for animation
                  width: 100,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          Text(
            resultMessage,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Score: $score",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => setChoice('7 Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text(
                  '7 Up',
                  style: TextStyle(
                    color: Colors.green.shade100,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => setChoice('7 Exact'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text(
                  '7 Exact',
                  style: TextStyle(
                    color: Colors.green.shade100,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => setChoice('7 Down'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text(
                  '7 Down',
                  style: TextStyle(
                    color: Colors.green.shade100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

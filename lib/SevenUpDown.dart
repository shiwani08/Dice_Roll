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
  String diceImage1 = 'assets/images/dice-1.png';
  String diceImage2 = 'assets/images/dice-1.png';

  void rollDice() {
    var roll1 = Random().nextInt(6) + 1;
    var roll2 = Random().nextInt(6) + 1;
    var sum = roll1 + roll2;

    setState(() {
      diceImage1 = 'assets/images/dice-$roll1.png';
      diceImage2 = 'assets/images/dice-$roll2.png';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(diceImage1, width: 100),
              const SizedBox(width: 10),
              Image.asset(diceImage2, width: 100),
            ],
          ),

          const SizedBox(width: 40,),

          const SizedBox(height: 20),
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
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text('7 Up',
                style: TextStyle(
                  color: Colors.green.shade100,
                ),),
              ),

              ElevatedButton(
                onPressed: () => setChoice('7 Exact'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text('7 Exact',
                  style: TextStyle(
                    color: Colors.green.shade100,
                  ),),
              ),

              ElevatedButton(
                onPressed: () => setChoice('7 Down'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text('7 Down',
                  style: TextStyle(
                    color: Colors.green.shade100,
                  ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

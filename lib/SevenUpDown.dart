import 'package:flutter/material.dart';
import 'dart:math';

class SevenUpSevenDown extends StatefulWidget {
  @override
  _SevenUpSevenDownState createState() => _SevenUpSevenDownState();
}

class _SevenUpSevenDownState extends State<SevenUpSevenDown> {
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
    return Scaffold(
      appBar: AppBar(title: Text("7 Up 7 Down Game")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(diceImage1, width: 100),
              SizedBox(width: 10),
              Image.asset(diceImage2, width: 100),
            ],
          ),
          SizedBox(height: 20),
          Text(
            resultMessage,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Score: $score",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => setChoice('7 Up'),
                child: Text('7 Up'),
              ),
              ElevatedButton(
                onPressed: () => setChoice('7 Down'),
                child: Text('7 Down'),
              ),
              ElevatedButton(
                onPressed: () => setChoice('7 Exact'),
                child: Text('7 Exact'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

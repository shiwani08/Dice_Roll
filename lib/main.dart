import 'package:dice_roll/roll-dice.dart';
import 'package:flutter/material.dart';

void main() {
  // const optimizes the runtime of the app
  // const REUSES the memory instead of creating new memory space for every object

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // Scaffold builds a good screen for the app and generally uses body function
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.black
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0, left: 15),
                child: Text(
                  '7 Up & Down',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.green[100],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: const RollDice(),
      ),
    ),
  );
}

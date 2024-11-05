import 'package:dice_roll/roll-dice.dart';
import 'package:dice_roll/SevenUpDown.dart';
import 'package:flutter/material.dart';

void main() {
  // const optimizes the runtime of the app
  // const REUSES the memory instead of creating new memory space for every object

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // Scaffold builds a good screen for the app and generally uses body function
      home: Scaffold(
        body: SevenUpSevenDown(),
      ),
    ),
  );
}

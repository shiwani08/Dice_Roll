import 'package:flutter/material.dart';

void main() {
  // const optimizes the runtime of the app
  // const REUSES the memory instead of creating new memory space for every object

  runApp(MaterialApp(

      // Scaffold builds a good screen for the app and generally uses body function
      home: Scaffold(

    body: Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(colors: [
          Color.fromARGB(100, 213, 163, 207),
          Color.fromARGB(100, 00, 100, 150),
        ],
        ),
      ),
      child: const Center(
        child: Text(
          "Hello Dart!",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 50,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    ),
  ),),);
}

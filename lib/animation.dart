import 'package:flutter/material.dart';

class DiceAnimation extends StatefulWidget {
  final String diceImage;
  DiceAnimation({Key?key, required this.diceImage}) : super(key: key);

  @override
  DiceAnimationState createState() => DiceAnimationState();
}

class DiceAnimationState extends State<DiceAnimation>
with SingleTickerProviderStateMixin{late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build (context) {
    return RotationTransition(
      turns: Tween(
          begin: 0.0, end: 1.0).animate(_controller),
      child: Image.asset(widget.diceImage, width: 100,),
    );
  }
}
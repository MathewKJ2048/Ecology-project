import 'package:flutter/material.dart';

class StepCard extends StatelessWidget{
  int i = 0;

  StepCard(this.i);

  @override
  Widget build(BuildContext context) {
    return Text('STEPS: $i', style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),);
  }
  
}
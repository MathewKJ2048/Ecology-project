import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget{
  int i;

  ScoreCard(this.i);

  @override
  Widget build(BuildContext context){
    return Text('SCORE: $i', style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
  }
}
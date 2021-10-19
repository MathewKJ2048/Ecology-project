import 'package:flutter/material.dart';

class Piece extends StatelessWidget {
  Function clicked;
  int val;

  Piece(this.val, this.clicked);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.purple, // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: (){ clicked(val);}, 
      child: 
        (val != 16)?Text('$val', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400
        ),):Text('', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),),  
    );
  }
}
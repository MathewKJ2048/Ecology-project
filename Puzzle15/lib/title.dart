import 'package:flutter/material.dart';

class TitleText extends StatelessWidget{
  var title;

  TitleText(this.title);

  @override 
  Widget build(BuildContext context){
    return Row(
        children:[
        Text('$title', style: 
          const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        ]
      );
  }
}
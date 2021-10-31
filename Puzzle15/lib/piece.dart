import 'package:flutter/material.dart';
import 'main.dart';

class Piece extends StatelessWidget {
  Function clicked;
  int val;
  String Name;

  Piece(this.val, this.clicked, this.Name);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialButton(
        padding: const EdgeInsets.all(0.0),
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: (val != 16)
                    ? AssetImage('assets/$Name$val.jpg')
                    : const AssetImage('images/white.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        onPressed: () {
          clicked(p: val);
        },
      ),
    );
  }
}

/*
return MaterialButton(
      padding: const EdgeInsets.all(0.0),
      elevation: 8.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: (val != 16)?AssetImage('images/tiger ($val).jpg'):const AssetImage('images/white.jpg'),
              fit: BoxFit.cover
            ),
        ),
      ),
      onPressed: () {
        clicked(p: val);
      },
    );
*/

/*
  ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: (){ clicked(p:val);}, 
      child: 
        (val != 16)?Text('$val', style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400
        ),):const Text('', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),),  
    );
*/
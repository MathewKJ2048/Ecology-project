import 'package:flutter/material.dart';

class Level extends StatelessWidget {
  String str;

  Level(this.str, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Raleway',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

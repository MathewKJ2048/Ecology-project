import 'package:flutter/material.dart';
import 'Piece.dart';

class PuzzleBoard extends StatelessWidget {
  var board = [];
  Function clicked;
  var Name;

  PuzzleBoard(this.board, this.clicked, this.Name);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      height: MediaQuery.of(context).size.height*.7,
      child: 
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2
          ),
          children: [
            Piece(board[0], clicked, Name),
            Piece(board[1], clicked, Name),
            Piece(board[2], clicked, Name),
            Piece(board[3], clicked, Name),
            Piece(board[4], clicked, Name),
            Piece(board[5], clicked, Name),
            Piece(board[6], clicked, Name),
            Piece(board[7], clicked, Name),
            Piece(board[8], clicked, Name),
            Piece(board[9], clicked, Name),
            Piece(board[10], clicked, Name),
            Piece(board[11], clicked,Name),
            Piece(board[12], clicked, Name),
            Piece(board[13], clicked, Name),
            Piece(board[14], clicked, Name),
            Piece(board[15], clicked, Name),
          ],
        )
    );
  }
}


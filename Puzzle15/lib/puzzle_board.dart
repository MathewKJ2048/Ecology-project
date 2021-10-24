import 'package:flutter/material.dart';
import 'Piece.dart';

class PuzzleBoard extends StatelessWidget {
  var board = [];
  Function clicked;

  PuzzleBoard(this.board, this.clicked);
  
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
            Piece(board[0], clicked),
            Piece(board[1], clicked),
            Piece(board[2], clicked),
            Piece(board[3], clicked),
            Piece(board[4], clicked),
            Piece(board[5], clicked),
            Piece(board[6], clicked),
            Piece(board[7], clicked),
            Piece(board[8], clicked),
            Piece(board[9], clicked),
            Piece(board[10], clicked),
            Piece(board[11], clicked),
            Piece(board[12], clicked),
            Piece(board[13], clicked),
            Piece(board[14], clicked),
            Piece(board[15], clicked),
          ],
        )
    );
  }
}


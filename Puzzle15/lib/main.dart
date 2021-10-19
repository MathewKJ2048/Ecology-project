import 'package:flutter/material.dart';
import 'package:puzzle15/puzzle_board.dart';

import 'score_card.dart';
import 'step_card.dart';
import 'title.dart';
void main() => runApp(const Puzzle15());

class Puzzle15 extends StatefulWidget {
  const Puzzle15({ Key? key }) : super(key: key);

  @override
  _Puzzle15State createState() => _Puzzle15State();
}

class _Puzzle15State extends State<Puzzle15> {
  final gridIS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  var grid = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]; 
  int steps = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puzzle15 - prototype',

      home: Scaffold(
        appBar: AppBar(
          title: TitleText('Puzzle 15'),
          backgroundColor: Colors.purple,
        ),

        body:Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 8,left: 8, right:8, bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StepCard(steps),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: (){}, 
                    child: 
                      Text('Reset', style: 
                        TextStyle(
                          fontFamily: 'Raleway',
                        ),
                      )
                  ),
                  ScoreCard(0),
                ],
              ),
              PuzzleBoard(grid,_clicky),
            ]
          ),
        )
      ),

    );
  }

  //---------------------------------------------------------------------------------------------------------------------//
  //---------------------------------------------------------------------------------------------------------------------//

  void _clicky(int p){
    print('Button Value.$p');
  
    /*
            j
        1  2  3  4
     i  5  6  7  8
        9  10 11 12
        13 14 15 16
    */
    
    int pos = grid.indexOf(p);

    int i,j;
    i = pos~/4;
    j = pos%4;

    print('i:$i, j:$j');

    // We swap only when empty box is present beside,above, left or right

    int up,down,left,right;

    up    = (i - 1)*4 + j;
    down  = (i + 1)*4 + j;

    left  = i*4 + j - 1;
    right = i*4 + j + 1;

    int swap = -1;
    //Above
    if (up >= 0 && grid[up] == 16) swap = up;
    if (down <= 15 && grid[down] == 16) swap = down;
    if (left >= 0 && left~/4 == pos~/4 && grid[left] == 16) swap = left;
    if (right <= 15 && right~/4 == pos~/4 && grid[right] == 16) swap = right;

    print('up: $up, down: $down, left: $left, right: $right');
    print('swap: $swap');

    if (!(swap == -1)){
      setState(() {
        grid[swap] = p;
        grid[pos] = 16;
        steps++;
      });
    }
  }
  //---------------------------------------------------------------------------------------------------------------------//
  //---------------------------------------------------------------------------------------------------------------------//
}
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:puzzle15/puzzle_board.dart';
import 'package:flutter/services.dart';

import 'score_card.dart';
import 'step_card.dart';
import 'title.dart';

void main() => runApp(const Puzzle15());

class Puzzle15 extends StatefulWidget {
  const Puzzle15({Key? key}) : super(key: key);

  @override
  _Puzzle15State createState() => _Puzzle15State();
}

class _Puzzle15State extends State<Puzzle15> {
  final gridIS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  var grid;
  int steps = 0;

  _Puzzle15State(){
    grid = _shuffle();
  }

  @override
  Widget build(BuildContext context) {
    _fixPortrait();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puzzle15 - prototype',
      home: Scaffold(
          appBar: AppBar(
            title: TitleText('Puzzle 15'),
            backgroundColor: Colors.green[700],
          ),
          body: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StepCard(steps),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[700],// background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        _clicky(reset: true);
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                        ),
                      )),
                  ScoreCard(0),
                ],
              ),
              PuzzleBoard(grid, _clicky),
            ]),
          )),
    );
  }

  void _fixPortrait() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  List<int> _shuffle() {
    var gS = gridIS;

    //Generate random puzzle
    for (int i = 15; i > 0; i--) {
      var rand = Random();
      int rP = rand.nextInt(i + 1);

      int tmp = gS[rP];
      gS[rP] = gS[i];
      gS[i] = tmp;
    }

    //Checking inversions
    int n = 0;
    for (int i = 0; i < 16; i++) {
      if (gS[i] != 16) {
        for (int j = i + 1; j < 16; j++) {
          if (j != gS[j] && gS[j] != 16) {
            n++;
          }
        }
      }
    }

    return (n % 2 == 0) ? gS : _shuffle();
  }

  void init() {
    grid = _shuffle();
  }

  void _clicky({int p = 0, bool reset = false}) {
    int pos = grid.indexOf(p);

    int i, j;
    i = pos ~/ 4;
    j = pos % 4;

    // We swap only when empty box is present beside,above, left or right

    int up, down, left, right;

    up = (i - 1) * 4 + j;
    down = (i + 1) * 4 + j;

    left = i * 4 + j - 1;
    right = i * 4 + j + 1;

    int swap = -1;

    //Above
    if (up >= 0 && grid[up] == 16) swap = up;
    if (down <= 15 && grid[down] == 16) swap = down;
    if (left >= 0 && left ~/ 4 == pos ~/ 4 && grid[left] == 16) swap = left;
    if (right <= 15 && right ~/ 4 == pos ~/ 4 && grid[right] == 16) swap = right;

    setState(() {
      if (!reset && swap != -1) {
        grid[swap] = p;
        grid[pos] = 16;
        if (grid == gridIS){
          print('done');
        }
        steps++;
      }

      if (reset) {
        grid = _shuffle();
        steps = 0;
      }
    });
  }
}

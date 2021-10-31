import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:fdottedline/fdottedline.dart';
//import 'package:confetti/confetti.dart';
import 'package:puzzle/animal.dart';

import 'level.dart';
import 'puzzle_board.dart';
import 'score_card.dart';
import 'step_card.dart';
import 'title.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Intro());
  }
}

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.green[700],
            body: SafeArea(
                child: Center(
                    child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "PUZZLE 15",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 56,
                    ),
                  ),
                  ElevatedButton(
                    child: const Text("PLAY"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[700], // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstRoute(),
                          ));
                    },
                  ),
                  ElevatedButton(
                    child: const Text("CREDITS"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[700], // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Credits()),
                      );
                    },
                  )
                ],
              ),
            )))));
  }
}

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credits',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: TitleText('Credits'),
            backgroundColor: Colors.green[700],
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Work in Progress"),
              ],
            ),
          )),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puzzle15',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: TitleText('Select The Level'),
            backgroundColor: Colors.green[700],
          ),
          body: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 125),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Easy    ",
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1, fontSize: 30 // foreground
                              ),
                        ),
                        ElevatedButton(
                          child: Level('Level 1'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Bengal Tiger",
                                      Des:
                                          "Scientific name: Panthera tigris tigris\nCauses for being endangered:\n\t1) Habitat destruction and loss of prey are the most important factors, the most significant in terms of immediate population depletion is poaching\n\t2) With decreasing vegetation and increasing human epoch, most of the herbivores on which tiger feeds are dwindling in number  ")),
                            );
                          },
                        ),
                        ElevatedButton(
                          child: Level('Level 2'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Asian Elephant",
                                      Des:
                                          "Scientific name: Elephas maximus\nCauses for being endangered:\n\t1) The Greatest Threats to Asian Elephanth the devastation includes Habitat loss and conflict with communities and Illegal hunting and trade.\n\t2) One of the greatest current threats to Asian elephants is habitat loss as human populations increase and grasslands and forests are converted to agricultural and other uses.")),
                            );
                          },
                        ),
                        ElevatedButton(
                          child: Level('Level 3'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Giant Panda",
                                      Des:
                                          "Scientific name: Ailuropoda melanoleuca\nCauses for being endangered:\n\t1) The Most critical danger is deforestation on the part of humans, which has led to permanent habitat loss in some areas which leads to food shortages\n\t2) Due to the lack of Bamboo species at a particular season leads to starvation and then population decreases")),
                            );
                          },
                        ),
                        Text(
                          "Medium",
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 2, fontSize: 30 // foreground
                              ),
                        ),
                        ElevatedButton(
                          child: Level('Level 4'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Grizzly Bear",
                                      Des:
                                          "Scientific name: Ursus arctos horribilis\nCauses for being endangered:\n\t1) Grizzly bears require large areas of undisturbed habitat but due to urban development ,it is not possibly the case\n\t2) Humans use lands where grizzly bears live, the bears are forced to retreat to increasingly smaller areas. The less area for grizzly bears to live, the fewer grizzly bears there are.")),
                            );
                          },
                        ),
                        ElevatedButton(
                          child: Level('Level 5'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Western Gorilla",
                                      Des:
                                          "Scientific name: Gorilla gorilla\nCauses for being endangered:\n\t1) The Greatest threats to the Western gorilla's are hunting and trade in gorilla meat, habitat degradation and loss, and the spread of disease\n\t2) The spread of the Ebola virus has been the main factor causing the massive decline in western gorilla and also the common respiratory rhino viruses can be dangerous to gorillas")),
                            );
                          },
                        ),
                        ElevatedButton(
                          child: Level('Level 6'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Orangutan",
                                      Des:
                                          "Scientific name: Pongo abelii\nCauses for being endangered:\n\t1) The destruction and degradation of the tropical rain forest, particularly lowland forest is the main problem for their low count\n\t2) Additionally, the illegal animal trade has been a factor in the decline of wild orangutan populations. Finally, orangutans are occasionally hunted and eaten by some of the indigenous peoples too")),
                            );
                          },
                        ),
                        Text(
                          "Hard\t\t",
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 2, fontSize: 30 // foreground
                              ),
                        ),
                        ElevatedButton(
                          child: Level('Level 7'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Penguin",
                                      Des:
                                          "Scientific name: Spheniscidae\nCauses for being endangered:\n\t1) Climate change is a growing concern for penguins that live in Antarctica because these species depend on sea ice for access to food and for places to breed but the sea ice has been disappearing\n\t2) Pollution and introduced predators and human disturbance are affecting penguins on land")),
                            );
                          },
                        ),
                        ElevatedButton(
                          child: Level('Level 8'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Sifaka",
                                      Des:
                                          "Scientific name: Propithecus\nCauses for being endangered:\n\t1) Sifakas are threatened by the destruction of their forest habitats. Some species are hunted for meat.\n\t2) Another critical danger of extinction due to habitat loss caused mainly by slash-and-burn agriculture for rice production as well as illegal rosewood logging")),
                            );
                          },
                        ),
                        ElevatedButton(
                          child: Level('Level 9'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700], // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Puzzle15(
                                      Name: "Snow Leopard",
                                      Des:
                                          "Scientific name: Panthera Uncia\nCauses for being endangered:\n\t1) Habitat loss, poaching and increasing conflict with communities have seen the world’s snow leopard population reduce drastically.\n\t2) Climate change is now putting the future of their mountain home at even greater risk")),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}

class Puzzle15 extends StatefulWidget {
  String Name;
  String Des;
  Puzzle15({Key? key, required this.Name, required this.Des}) : super(key: key);

  @override
  _Puzzle15State createState() => _Puzzle15State(Name, Des);
}

class _Puzzle15State extends State<Puzzle15> {
  final gridIS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  var grid = [];
  int steps = 0;

  var name;
  var Des;

  _Puzzle15State(this.name, this.Des) {
    init();
  }

  @override
  Widget build(BuildContext context) {
    _fixPortrait();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puzzle15 - prototype',
      home: Scaffold(
          appBar: AppBar(
            title: TitleText('15Puzzle'),
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
                        primary: Colors.green[700], // background
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
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[700], // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstRoute()),
                        );
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                        ),
                      )),
                  ScoreCard(0),
                ],
              ),
              PuzzleBoard(grid, _clicky, name),
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
    if (right <= 15 && right ~/ 4 == pos ~/ 4 && grid[right] == 16)
      swap = right;

    setState(() {
      if (!reset && swap != -1) {
        grid[swap] = p;
        grid[pos] = 16;

        if (listEquals(grid, gridIS)) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => animal(name, Des)),
          );
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

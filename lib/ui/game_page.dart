import 'dart:math';
import 'package:color_game/dialogs.dart';
import 'package:flutter/material.dart';

import '../helper.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

Color getRandomColor() {
  int red = Random().nextInt(256);
  int green = Random().nextInt(256);
  int blue = Random().nextInt(256);
  return Color.fromARGB(255, red, green, blue);
}

List<Color> getRandomColorList() {
  List<Color> randomColorList = [];
  for (var i = 0; i <= 9; i++) {
    randomColorList.add(getRandomColor());
  }
  return randomColorList;
}

class _GamePageState extends State<GamePage> {
  List<Color> randomColorList = getRandomColorList();
  int randomIndex = Random().nextInt(9);
  int score = 0;

  checkColor(Color selectedColor) async {
    final retrievedUserList =
        await SharedPreferencesHelper.getUserSettingsList();
    if (selectedColor == randomColorList[randomIndex]) {
      setState(() {
        score++;
        randomIndex = Random().nextInt(9);
        randomColorList = getRandomColorList();
      });
    } else {
      if (score >= 1) {
        if (retrievedUserList.length > 9 &&
            retrievedUserList.last.score < score) {
          Dialogs.showHighScoreDialog(
              context, randomColorList[randomIndex], score.toString());
          score = 0;
        } else if (retrievedUserList.length < 10) {
          Dialogs.showHighScoreDialog(
              context, randomColorList[randomIndex], score.toString());
          score = 0;
        } else {
          Dialogs.showGameOverDialog(
              context, randomColorList[randomIndex], score.toString());
          score = 0;
        }
      } else {
        Dialogs.showGameOverDialog(
            context, randomColorList[randomIndex], score.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Column(
                children: [
                  Text(
                      "RGB ( ${randomColorList[randomIndex].red.toString()}, ${randomColorList[randomIndex].green.toString()}, ${randomColorList[randomIndex].blue.toString()} )",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 64),
                    child: Text("Score : $score",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[0],
                            color: randomColorList[0],
                            onPressed: () {
                              checkColor(randomColorList[0]);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[1],
                            color: randomColorList[1],
                            onPressed: () {
                              checkColor(randomColorList[1]);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[2],
                            color: randomColorList[2],
                            onPressed: () {
                              checkColor(randomColorList[2]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[3],
                            color: randomColorList[3],
                            onPressed: () {
                              checkColor(randomColorList[3]);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[4],
                            color: randomColorList[4],
                            onPressed: () {
                              checkColor(randomColorList[4]);
                            },
                            // style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(1, 1, 1, 0)),
                            // onPressed: () {
                            //                               checkColor(randomColorList[4]);}, child: Text(""),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[5],
                            color: randomColorList[5],
                            onPressed: () {
                              checkColor(randomColorList[5]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[6],
                            color: randomColorList[6],
                            onPressed: () {
                              checkColor(randomColorList[6]);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[7],
                            color: randomColorList[7],
                            onPressed: () {
                              checkColor(randomColorList[7]);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            hoverColor: randomColorList[8],
                            color: randomColorList[8],
                            onPressed: () {
                              checkColor(randomColorList[8]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}

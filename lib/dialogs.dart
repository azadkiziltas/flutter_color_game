import 'package:color_game/ui/game_page.dart';
import 'package:color_game/user_score_model.dart';
import 'package:flutter/material.dart';

import 'helper.dart';

class Dialogs {
  static var name = "";

  static Future<void> showGameOverDialog(
      context, Color color, String score) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Game Over')),
          content: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Your Score : $score',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: MaterialButton(
                        elevation: 0,
                        hoverElevation: 0,
                        hoverColor: color,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        color: color,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Home Page'),
              onPressed: () {
                Navigator.of(context).pop();
                name = "";
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            TextButton(
              child: const Text('New Game'),
              onPressed: () {
                name = "";
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const GamePage();
                  },
                ));
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  static Future<void> showHighScoreDialog(
      context, Color color, String score) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Congratulations')),
          content: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Your Score : $score',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Home Page'),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                final retrievedUserList =
                    await SharedPreferencesHelper.getUserSettingsList();
                if (retrievedUserList.length > 9) {
                  retrievedUserList.removeLast();
                }
                retrievedUserList
                    .add(UserScore(username: name.length > 0 ? name : "Unknown", score: int.parse(score)));

                retrievedUserList.sort((a, b) => b.score.compareTo(a.score));

                SharedPreferencesHelper.saveUserSettingsList(retrievedUserList);

                name = "";
                Navigator.of(context).pop();
                showGameOverDialog(context, color, score);
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}

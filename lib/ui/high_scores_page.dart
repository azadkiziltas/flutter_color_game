import 'package:flutter/material.dart';

import '../user_score_model.dart';

class HighScoresPage extends StatefulWidget {
  final List<UserScore> userScoreList;

  HighScoresPage({super.key, required this.userScoreList});

  @override
  State<HighScoresPage> createState() => _HighScoresPageState();
}

class _HighScoresPageState extends State<HighScoresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("High Scores"), centerTitle: true),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: SizedBox(
              width: 300,
              height: 450,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: widget.userScoreList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text(
                        "${index+1}  --->",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                      title: Center(
                          child: Text(
                        widget.userScoreList[index].username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      subtitle: Center(
                          child: Text(
                              "Score : ${widget.userScoreList[index].score.toString()}")),
                    );
                  }),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 240,
                height: 60,
                child: FilledButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text(
                    "Home Page",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

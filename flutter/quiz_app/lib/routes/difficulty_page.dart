import 'package:flutter/material.dart';
import 'package:quiz_app/routes.dart';

class DifficultyPage extends StatelessWidget {
  const DifficultyPage(this.category, {Key? key}) : super(key: key);

  final int category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qwiz"),
      ),
      body: Column(
        children: [
          Text("Select difficulty"),
          ElevatedButton(
              onPressed: () => _selectDifficulty(context, "easy"),
              child: Text("Easy")),
          ElevatedButton(
              onPressed: () => _selectDifficulty(context, "medium"),
              child: Text("Medium")),
          ElevatedButton(
              onPressed: () => _selectDifficulty(context, "hard"),
              child: Text("Hard")),
        ],
      ),
    );
  }

  void _selectDifficulty(BuildContext context, String difficulty) {
    final url =
        "https://opentdb.com/api.php?amount=10&category=$category&difficulty=$difficulty&type=multiple&encode=url3986";
    Navigator.of(context).pushNamed(RouteGenerator.quizPage, arguments: url);
  }
}

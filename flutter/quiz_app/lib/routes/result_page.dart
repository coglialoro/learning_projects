import 'package:flutter/material.dart';
import 'package:quiz_app/routes.dart';

class ResultPageArguments {
  const ResultPageArguments(this.time, this.correctAnswers);

  final Duration time;
  final int correctAnswers;
}

class ResultPage extends StatelessWidget {
  const ResultPage(this.time, this.correctAnswers, {Key? key})
      : super(key: key);

  final Duration time;
  final int correctAnswers;

  @override
  Widget build(BuildContext context) {
    final passed = correctAnswers >= 5;

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(RouteGenerator.homePage);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Qwiz - Results"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You answered at $correctAnswers questions correctly",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "You ${passed ? "passed" : "failed"} this quiz.",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "It took you ${time.inSeconds} seconds to complete",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

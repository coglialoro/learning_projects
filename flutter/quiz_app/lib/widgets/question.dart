import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(this.question, this.callback, {Key? key})
      : super(key: key);

  final Question question;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    final correctIndex = Random().nextInt(3).floor();
    final answers = [
      ...question.incorrectAnswers.sublist(0, correctIndex),
      question.correctAnswer,
      ...question.incorrectAnswers.sublist(correctIndex)
    ];

    return Column(
      children: [
        Text(
          Uri.decodeFull(question.question),
          style: Theme.of(context).textTheme.headline6,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: answers
                .map((answer) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (answer == question.correctAnswer) {
                              callback(true);
                            } else {
                              callback(false);
                            }
                          },
                          child: Text(Uri.decodeFull(answer))),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

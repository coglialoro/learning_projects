import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/routes.dart';
import 'package:quiz_app/routes/result_page.dart';
import 'package:quiz_app/widgets/question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(this.url, {Key? key}) : super(key: key);

  final String url;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Quiz quiz = Quiz([]);
  bool loaded = false;
  int index = 0;
  int correctAnswers = 0;
  late DateTime start;

  @override
  void initState() {
    super.initState();
    _getQuizData();
  }

  void _getQuizData() async {
    final response = await http.get(Uri.parse(widget.url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      if (json["response_code"] == 1) {
        Navigator.of(context).pushNamed(RouteGenerator.homePage);
      } else {
        setState(() {
          quiz = Quiz.fromJson(json);
          loaded = true;
          start = DateTime.now();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qwiz"),
      ),
      body: loaded
          ? QuestionWidget(quiz.questions[index], _nextQuestion)
          : Center(child: CircularProgressIndicator()),
    );
  }

  void _nextQuestion(bool answeredCorrect) {
    if (index < quiz.length - 1) {
      // go to next question
      setState(() {
        if (answeredCorrect) {
          correctAnswers++;
        }
        index++;
      });
    } else {
      // go to result page

      final time = DateTime.now().difference(start);
      Navigator.of(context).pushNamed(RouteGenerator.resultPage,
          arguments: ResultPageArguments(time, correctAnswers));
    }
  }
}

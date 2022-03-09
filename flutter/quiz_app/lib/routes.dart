import 'package:flutter/material.dart';
import 'package:quiz_app/routes/difficulty_page.dart';
import 'package:quiz_app/routes/home_page.dart';
import 'package:quiz_app/routes/quiz_page.dart';
import 'package:quiz_app/routes/result_page.dart';

class RouteGenerator {
  static const String homePage = "/";
  static const String difficultyPage = "/difficulty";
  static const String quizPage = "/quiz";
  static const String resultPage = "/result";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteGenerator.homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case RouteGenerator.difficultyPage:
        final category = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => DifficultyPage(category),
        );

      case RouteGenerator.quizPage:
        final url = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => QuizPage(url),
        );
      case RouteGenerator.resultPage:
        final resultArgs = settings.arguments as ResultPageArguments;

        return MaterialPageRoute(
          builder: (_) =>
              ResultPage(resultArgs.time, resultArgs.correctAnswers),
        );

      default:
        throw FormatException("Unknown route");
    }
  }
}

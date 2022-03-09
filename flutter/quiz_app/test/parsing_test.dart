import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/models/quiz.dart';

const response =
    '{"response_code":0,"results":[{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"What does the &quot;MP&quot; stand for in MP3?","correct_answer":"Moving Picture","incorrect_answers":["Music Player","Multi Pass","Micro Point"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"What does GHz stand for?","correct_answer":"Gigahertz","incorrect_answers":["Gigahotz","Gigahetz","Gigahatz"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"What amount of bits commonly equals one byte?","correct_answer":"8","incorrect_answers":["1","2","64"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"If you were to code software in this language you&#039;d only be able to type 0&#039;s and 1&#039;s.","correct_answer":"Binary","incorrect_answers":["JavaScript","C++","Python"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"What does the Prt Sc button do?","correct_answer":"Captures what&#039;s on the screen and copies it to your clipboard","incorrect_answers":["Nothing","Saves a .png file of what&#039;s on the screen in your screenshots folder in photos","Closes all windows"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"In web design, what does CSS stand for?","correct_answer":"Cascading Style Sheet","incorrect_answers":["Counter Strike: Source","Corrective Style Sheet","Computer Style Sheet"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"What is the code name for the mobile operating system Android 7.0?","correct_answer":"Nougat","incorrect_answers":["Ice Cream Sandwich","Jelly Bean","Marshmallow"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"This mobile OS held the largest market share in 2012.","correct_answer":"iOS","incorrect_answers":["Android","BlackBerry","Symbian"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"How many values can a single byte represent?","correct_answer":"256","incorrect_answers":["8","1","1024"]},{"category":"Science: Computers","type":"multiple","difficulty":"easy","question":"What language does Node.js use?","correct_answer":"JavaScript","incorrect_answers":["Java","Java Source","Joomla Source Code"]}]}';

void main() {
  test("parse json correctly", () {
    final json = jsonDecode(response);
    final quiz = Quiz.fromJson(json);
    print(quiz);
  });
}

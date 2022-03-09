import 'package:quiz_app/models/question.dart';

class Quiz {
  const Quiz(this.questions);

  final List<Question> questions;

  int get length => questions.length;

  factory Quiz.fromJson(Map<String, dynamic> json) {
    try {
      final results = json["results"] as List<dynamic>;
      final qs = List<Question>.from(results.map((q) => Question.fromJson(q)));
      return Quiz(qs);
    } catch (e) {
      print(e);
      throw Exception("Quiz json error");
    }
  }

  @override
  String toString() {
    String result = "";
    questions.forEach((element) {
      result += "\n$element";
    });
    return result;
  }
}

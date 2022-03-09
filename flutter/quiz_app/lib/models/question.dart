class Question {
  const Question(this.question, this.correctAnswer, this.incorrectAnswers);

  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  factory Question.fromJson(Map<String, dynamic> json) {
    try {
      return Question(
        json["question"],
        json["correct_answer"],
        List<String>.from(
          json["incorrect_answers"],
        ),
      );
    } catch (e) {
      print(e);
      throw Exception("Question json error");
    }
  }

  @override
  String toString() {
    return "$question";
  }
}

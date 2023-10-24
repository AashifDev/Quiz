class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  /*-------also can use-------*/
  //const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get suffuledAnswers {
    final suffledList = List.of(answers);
    suffledList.shuffle();
    return suffledList;
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/styled_text.dart';
import 'package:quiz/view/question_screen.dart';
import 'package:quiz/view/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnser;
  final Function() restartQuiz;

  const ResultScreen(
      {Key? key, required this.chosenAnser, required this.restartQuiz})
      : super(key: key);

  List<Map<String, Object>> get summryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnser.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnser[i],
        'isShowCorrectAnswer': false
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuesion = summryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText(
              text:
                  'You answered $numCorrectQuesion out of $numTotalQuestion questions correctly!',
              fontSize: 25,
              color: Colors.white,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}

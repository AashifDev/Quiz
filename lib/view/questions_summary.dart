import 'package:flutter/material.dart';
import 'package:quiz/styled_text.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary(this.summaryData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  //Queston index
                  StyledText(
                    text: ((data['question_index'] as int) + 1).toString(),
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        //Question
                        StyledText(
                          text: data['question'] as String,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        //Correct answer
                        StyledText(
                          text: data['user_answer'] as String,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        //User answer
                        StyledText(
                          text: data['correct_answer'] as String,
                          fontSize: 18,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

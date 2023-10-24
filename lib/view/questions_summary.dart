import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Queston index
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: StyledText(
                          text:
                              ((data['question_index'] as int) + 1).toString(),
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Question
                          StyledText(
                            text: data['question'] as String,
                            fontSize: 18,
                            // textAlign: TextAlign.left,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          //User answer
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                                child:
                                    Lottie.asset('assets/lottie/failed.json'),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 200,
                                child: StyledText(
                                  text: data['user_answer'] as String,
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          //Correct answer
                          Row(
                            children: [
                              SizedBox(
                                height: 22,
                                child: Lottie.asset('assets/lottie/done.json'),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 200,
                                child: StyledText(
                                  text: data['correct_answer'] as String,
                                  fontSize: 18,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

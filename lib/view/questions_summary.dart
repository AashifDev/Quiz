import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/styled_text.dart';

class QuestionsSummary extends StatefulWidget {
  final List<Map<String, dynamic>> summaryData;
  const QuestionsSummary(this.summaryData, {Key? key}) : super(key: key);

  @override
  State<QuestionsSummary> createState() => _QuestionsSummaryState();
}

class _QuestionsSummaryState extends State<QuestionsSummary> {
  @override
  Widget build(BuildContext context) {
    bool isShow = false;

    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: SingleChildScrollView(
        child: Column(
          children: widget.summaryData.map(
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
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    Lottie.asset('assets/lottie/failed.json'),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: StyledText(
                                  text: data['user_answer'] as String,
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                data['isShowCorrectAnswer'] =
                                    !data['isShowCorrectAnswer'];
                              });
                            },
                            child: const StyledText(
                              text: 'View Answer',
                              textAlign: TextAlign.right,
                              fontSize: 16,
                            ),
                          ),
                          //Correct answer
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            visible: data['isShowCorrectAnswer'],
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child:
                                      Lottie.asset('assets/lottie/done.json'),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  decoration: const BoxDecoration(),
                                  width: 200,
                                  child: StyledText(
                                    text: data['correct_answer'] as String,
                                    fontSize: 18,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
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

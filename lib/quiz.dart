import 'package:flutter/material.dart';
import 'package:quiz/view/home_screen.dart';
import 'package:quiz/view/question_screen.dart';
import 'package:quiz/view/result_screen.dart';
import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = HomeScreen(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      //    selectedAnswer = [];
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    selectedAnswer.clear();
    setState(() {
      activeScreen = 'home-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // var screenWidget = activeScreen == 'start-screen'
    //     ? HomeScreen(switchScreen)
    //     : const QuestionScreen();

    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget =
          ResultScreen(chosenAnser: selectedAnswer, restartQuiz: restartQuiz);
    }

    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.cyan,
              Colors.cyan,
            ],
          )),
          child: screenWidget,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import '../styled_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  //final Function startQuiz;
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: .5,
          //   child: Image.asset(
          //     'assets/images/quiz.png',
          //     width: 100,
          //   ),
          // ),
          Image.asset(
            'assets/images/quiz.png',
            width: 100,
            color: const Color.fromARGB(156, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          const StyledText(
            text: 'Learn Flutter the fun way!',
            fontSize: 25,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: () => startQuiz(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              elevation: 1,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
            label: const StyledText(
              text: 'StartNow',
              fontSize: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

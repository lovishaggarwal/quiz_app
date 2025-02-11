import 'package:flutter/material.dart';
import 'package:quiz_app_1/utilities.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          color: Colors.white30,
        ),
        SizedBox(
          height: 20,
        ),
        MainText(text: "Learn Flutter the fun way!"),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: startQuiz,
          child: Text('Start Quiz'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app_1/home_page.dart';
import 'package:quiz_app_1/question_page.dart';
import 'package:quiz_app_1/utilities.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {


  Widget? activeScreen;

  @override
  void initState() {
    activeScreen =  HomePage(startQuiz);
    super.initState();
  }

  void startQuiz () {
    setState(() {
      activeScreen =  QuestionsPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [
            const Color.fromARGB(255, 139, 139, 139),
            const Color.fromARGB(255, 0, 0, 0)
          ],
          child: activeScreen ?? Container(),
        ),
      ),
    );
  }
}

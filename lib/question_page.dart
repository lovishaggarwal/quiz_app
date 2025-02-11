import 'package:flutter/material.dart';
import 'package:quiz_app_1/data/questions.dart';
import 'package:quiz_app_1/utilities.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int currentQuestionNo = 0;

  int correctCount = 0;



  void checkAnswer(String userChoice) {
    // if ((currentQuestion.answer).toString() == userChoice) {
    //   correctCount += 1;
    // }
    if (userChoice == questions[currentQuestionNo].answer){
      correctCount++;
      print('You got it right!');
    }
    else{
      print('Wrong Answer');
    }
    setState(() {
      if (currentQuestionNo < questions.length-1) {
        currentQuestionNo++;
      } else {
        print('the end');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(currentQuestionNo);
    final currentQuestion = questions[currentQuestionNo];
    List<String> shuffleOptions = currentQuestion.options;
    shuffleOptions.shuffle();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...shuffleOptions.map((option) {
              return AnswerButton(
                onTap: (){
                  checkAnswer(option);
                },
                optionText: option,
              );
            }),
          ],
        ),
      ),
    );
  }
}

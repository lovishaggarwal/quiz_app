import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_1/dashboard.dart';
import 'package:quiz_app_1/data/constants.dart';
import 'package:quiz_app_1/data/questions.dart';
import 'package:quiz_app_1/result_page.dart';
import 'package:quiz_app_1/utilities.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int currentQuestionNo = 0;

  int correctCount = 0;

  List<List<String>> responseData = [];

  void checkAnswer(String userChoice) {
    // if ((currentQuestion.answer).toString() == userChoice) {
    //   correctCount += 1;
    // }
    if (userChoice == questions[currentQuestionNo].answer) {
      correctCount++;
    }
    responseData.add([
      questions[currentQuestionNo].question,
      userChoice,
      questions[currentQuestionNo].answer
    ]);
    setState(() {
      if (currentQuestionNo < questions.length - 1) {
        currentQuestionNo++;
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                  currentScore: correctCount, responseData: responseData)),
          (route) => false,
        );
      }
    });
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // int _selectedValue = 1;
    final currentQuestion = questions[currentQuestionNo];
    List<String> shuffleOptions = currentQuestion.options;
    shuffleOptions.shuffle();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (() async {
            await signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));

          }),
          child: Icon(Icons.exit_to_app)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Color(0xfff4f6f8),
              child: Image.asset(
                overleafImage,
                height: 40,
              ),
            ),
            SizedBox(height: 20),
            boldText(
                textData: 'Question ${currentQuestionNo + 1} :', fontSize: 24),
            SizedBox(height: 10),
            Text(
              currentQuestion.question,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              // textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...shuffleOptions.map(
              (option) {
                return CustomButton(
                  onTap: () {
                    checkAnswer(option);
                  },
                  optionText: option,
                  correctAnswer: questions[currentQuestionNo].answer,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app_1/dashboard.dart';
import 'package:quiz_app_1/data/constants.dart';
import 'package:quiz_app_1/data/questions.dart';
import 'package:quiz_app_1/question_page.dart';
import 'package:quiz_app_1/utilities.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.currentScore, required this.responseData, super.key});

  final int currentScore;
  final List<List<String>> responseData;
  final int totalQuestions = questions.length;

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final int percentage = (currentScore * 100 / totalQuestions).toInt();
    print(responseData);

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xfff4f6f8),
                  child: Image.asset(
                    overleafImage,
                    height: 35,
                  ),
                ),
                SizedBox(width: 10),
                normallText(
                    textData: 'Leafboard',
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ],
            ),
            SizedBox(height: 20),
            normallText(
                textData: 'Result', fontSize: 40, fontWeight: FontWeight.w900),
            SizedBox(height: 20),
            CircularPercentIndicator(
              animation: true,
              animationDuration: 1000,
              radius: 75.0,
              lineWidth: 9.0,
              percent: percentage / 100,
              center: new Text(
                percentage.toString() + '%',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
              ),
              progressColor: (percentage >= 80)
                  ? Colors.greenAccent
                  : (percentage >= 50)
                      ? Colors.yellowAccent
                      : Colors.redAccent,
            ),
            SizedBox(height: 20),
            boldText(
                textData:
                    'You scored ${currentScore.toString()} out of ${totalQuestions}',
                fontSize: 24),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              // width: 300,
              child: ListView.builder(
                itemCount: responseData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    // leading: const Icon(Icons.add),
                    title:
                        boldText(textData: responseData[index][0], fontSize: 16

                            // textScaleFactor: 1.5,
                            ),
                    trailing: Icon(
                        responseData[index][1] == responseData[index][2]
                            ? Icons.done
                            : Icons.close),
                    subtitle: RichText(
                      text: TextSpan(
                        // text: 'Your choice: ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Your choice: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: responseData[index][1],
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '\nCorrect Answer: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: responseData[index][2],
                            // style: TextStyle(
                            //   fontWeight: FontWeight.bold,
                            // ),
                          ),
                        ],
                      ),
                    ),
                    // subtitle: Text('Your choice: ${responseData[index][1]}\nCorrect Answer: ${responseData[index][2]}'),
                    // selected: true,
                    onTap: () {},
                  );
                  // when user tap the list tile then below output will be shown.
                },
              ),
            ),
            SizedBox(height: 20),
            FilledButton.icon(
              icon: Icon(Icons.arrow_forward_ios_outlined, size: 15),
              iconAlignment: IconAlignment.end,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuestionsPage()),
                  (route) => false,
                );
              },
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                backgroundColor: btnGreen,
                foregroundColor: Colors.black,
                iconColor: Colors.black,
              ),
              label: boldText(textData: 'Restart Quiz', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

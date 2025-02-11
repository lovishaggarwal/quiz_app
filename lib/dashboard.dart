import 'package:flutter/material.dart';
import 'package:quiz_app_1/data/constants.dart';
import 'package:quiz_app_1/login_page.dart';
import 'package:quiz_app_1/utilities.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGrey,
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 55),
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: bgBlue,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width / 3, 120)),
                  ),
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xfff4f6f8),
                  child: Image.asset(
                    overleafImage,
                    height: 70,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            boldText(textData: "Leafboard", fontSize: 40),
            SizedBox(height: 30),
            boldText(
                textData: 'A platform build for a new way of working',
                fontSize: 14),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            FilledButton.icon(
              icon: Icon(Icons.arrow_right_alt),
              iconAlignment: IconAlignment.end,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(btnGreen),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                iconColor: WidgetStatePropertyAll(Colors.black),
              ),
              label: boldText(textData: 'Get started for free', fontSize: 14),
            ),
          ],
        ),
    );
  }
}

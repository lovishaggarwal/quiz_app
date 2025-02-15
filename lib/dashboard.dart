import 'package:flutter/material.dart';
import 'package:quiz_app_1/data/constants.dart';
import 'package:quiz_app_1/login_page.dart';
import 'package:quiz_app_1/utilities.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
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
            boldText(textData: "Leafboard", fontSize: 50),
            SizedBox(height: 25),
            boldText(
                textData: 'A platform build for a new way of learning',
                fontSize: 18),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            FilledButton.icon(
              icon: Icon(Icons.arrow_forward_ios_outlined, size: 15),
              iconAlignment: IconAlignment.end,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                backgroundColor: btnGreen,
                foregroundColor: Colors.black,
                iconColor: Colors.black,
              ),
              label: boldText(textData: 'Get started for free', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

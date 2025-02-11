import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestion {
  QuizQuestion(
      {required this.question, required this.options, required this.answer});

  final String question;
  final List<String> options;
  final String answer;
}

class MainText extends StatelessWidget {
  const MainText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key, required this.colors, required this.child});

  final Widget child;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.optionText, required this.onTap, super.key});

  final Function() onTap;
  final String optionText;

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: OutlinedButton.icon(
                      onPressed: onTap,
                      label: boldText(
                          textData: optionText, fontSize: 16),
                      icon: Icon(Icons.radio_button_unchecked_outlined),
                      style: OutlinedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.black, width: 0.3),
                      ),
                    ),
                  );
    // return ElevatedButton(
    //   onPressed: onTap,
    //   style: ElevatedButton.styleFrom(
    //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
    //     backgroundColor: Colors.black38,
    //     foregroundColor: Colors.white,
    //     alignment: Alignment.center,
    //   ),
    //   child: Text(optionText,
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontWeight: FontWeight.bold)),
    // );
  }
}

Widget boldText({required String textData, required double fontSize}) {
  return Text(
    textData,
    style: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold, fontSize: fontSize, letterSpacing: -0.5),
  );
}

Widget normallText({required String textData, required double fontSize, FontWeight? fontWeight}) {
  return Text(
    textData,
    style: GoogleFonts.quicksand(
        fontWeight: fontWeight ??= FontWeight.normal, fontSize: fontSize, letterSpacing: -0.5),
  );
}


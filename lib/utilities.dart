import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_1/data/constants.dart';

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

class AnswerButton extends StatefulWidget {
  const AnswerButton(
      {required this.optionText, required this.onTap, super.key});

  final Function() onTap;
  final String optionText;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: MaterialButton(
        onPressed: widget.onTap,
        focusColor: btnGreen,
        hoverColor: btnGreen,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.3, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Row(
          children: [
            Icon(Icons.radio_button_unchecked_outlined, size: 18),
            SizedBox(width: 8),
            Text(
              widget.optionText,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: -0.5),
            )
          ],
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

class CustomButton extends StatefulWidget {
  final String optionText;
  final VoidCallback onTap;
  final String correctAnswer;

  CustomButton({required this.optionText, required this.onTap, required this.correctAnswer});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  // Color buttonColor = Colors.transparent;
  // Color buttonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          setState(() {
            if (widget.correctAnswer == widget.optionText){
              // buttonColor = btnGreen;
              print('fluttergood');
            }
            else {
            // buttonColor = Colors.redAccent;
            print('flutterqwerty');
            }
          });
          widget.onTap();
        },
        splashColor: widget.correctAnswer == widget.optionText ? btnGreen : Colors.redAccent, // Splash effect
        borderRadius: BorderRadius.circular(30), // Rounded corners
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            // color: buttonColor, // Dynamic background color
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 0.3, color: Colors.black),
          ),
          child: Text(
            widget.optionText,
            // overflow: TextOverflow.ellipsis,
            // overflow: TextOverflow.visible,
            softWrap: true,
            style: GoogleFonts.quicksand(
              
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    );
  }
}

Widget boldText({required String textData, required double fontSize}) {
  return Text(
    textData,
    style: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold, fontSize: fontSize, letterSpacing: -0.5),
  );
}

Widget normallText(
    {required String textData,
    required double fontSize,
    FontWeight? fontWeight}) {
  return Text(
    textData,
    style: GoogleFonts.quicksand(
        fontWeight: fontWeight ??= FontWeight.normal,
        fontSize: fontSize,
        letterSpacing: -0.5),
  );
}

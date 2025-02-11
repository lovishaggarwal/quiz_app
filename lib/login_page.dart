import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:quiz_app_1/data/constants.dart';
import 'package:quiz_app_1/question_page.dart';
import 'package:quiz_app_1/utilities.dart';
import 'dart:io' show Platform;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  Color btnbackgroundColor = Colors.grey.shade300;

  Color btnTextColor = Colors.black26;

  Color emailBorderColor = Colors.black45;

  bool btnVisible = false;

  @override
  Widget build(BuildContext context) {
    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(overleafImage, height: 30),
                  SizedBox(width: 20),
                  boldText(textData: 'Leafboard', fontSize: 30),
                ],
              ),
              SizedBox(height: 20),
              normallText(
                  textData: 'Work without limits',
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(textData: 'Your email address', fontSize: 16),
                    SizedBox(height: 10),
                    TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp("[0-9@a-zA-Z.]")),
                      ],
                      autocorrect: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 18,
                          ),
                          onPressed: () => emailController.clear(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(width: 0.7, color: Colors.black38),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 194, 109, 88)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 194, 109, 88)),
                        ),

                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                        // fillColor: bgGrey,
                        // filled: true,
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: emailBorderColor, width: 0.7),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: validateEmail,
                      onChanged: (value) {
                        setState(
                          () {
                            if (validateEmail(value) == null) {
                              emailBorderColor =
                                  Color.fromARGB(255, 194, 109, 88);
                            } else {
                              emailBorderColor = Colors.black38;
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    boldText(textData: 'Choose a password', fontSize: 16),
                    SizedBox(height: 10),
                    PasswordField(
                      // backgroundColor: Colors.blue.withValues(alpha: 0.2),
                      errorMessage: '''
Password should have:
- uppercase letter(s)
- lowercase letter(s)
- digit(s)
- special character(s)
- minimum length of 8 characters''',
                      // hintText: 'min 8 characters',
                      border: PasswordBorder(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: FilledButton.icon(
                        icon: Icon(Icons.arrow_forward_ios_outlined, size: 15),
                        iconAlignment: IconAlignment.end,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QuestionsPage()),
                          );
                        },
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: btnGreen,
                          foregroundColor: Colors.black,
                          iconColor: Colors.black,
                        ),
                        label: boldText(textData: 'Continue', fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Divider(thickness: 0.3)),
                  Text(" or "),
                  Expanded(child: Divider(thickness: 0.3)),
                ],
              ),
              Container(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  label:
                      boldText(textData: 'Sign in with Google', fontSize: 16),
                  icon: SvgPicture.asset(
                    'assets/images/google.svg',
                    semanticsLabel: 'Google Logo',
                    height: 20,
                    width: 20,
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black, width: 0.3),
                  ),
                ),
              ),
              // Is platform is iOS or macOS, show apple sign in
              if (Platform.isIOS || Platform.isMacOS) ...[
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label:
                        boldText(textData: 'Sign in with Apple', fontSize: 16),
                    icon: Image.asset('assets/images/apple.png', height: 25),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black, width: 0.3),
                    ),
                  ),
                ),
              ],
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  label: boldText(textData: 'Sign in with Phone', fontSize: 16),
                  icon: SvgPicture.asset(
                    'assets/images/phone.svg',
                    semanticsLabel: 'Google Logo',
                    height: 20,
                    width: 20,
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black, width: 0.3),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

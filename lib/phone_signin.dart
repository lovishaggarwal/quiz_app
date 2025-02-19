import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:quiz_app_1/data/constants.dart';
import 'package:quiz_app_1/question_page.dart';
import 'package:quiz_app_1/utilities.dart';
import 'dart:io' show Platform;

class PhoneSignInPage extends StatefulWidget {
  const PhoneSignInPage({super.key});

  @override
  State<PhoneSignInPage> createState() => _PhoneSignInPageState();
}

class _PhoneSignInPageState extends State<PhoneSignInPage> {
  bool ifOtpSent = false;

  FocusNode focusNode = FocusNode();

  TextEditingController phoneController = TextEditingController();

  String verId = '';

  void sendCode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneController.text,
          verificationCompleted: (PhoneAuthCredential credential) {
            signIn();
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.message);
          },
          codeSent: (String verificationId, int? resendToken) {
            verId = verificationId;
            print('Code sent');
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print('Code auto retrieval timeout');
          },
          timeout: Duration(seconds: 60));
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  String smsCode = '';

  void signIn() async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential)
          .then((value) {
        print('User signed in');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QuestionsPage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(verId);
      print('SMSCODE: ' + smsCode);
    } catch (e) {
      print(e);
      print(verId);
      print('SMSCODE: ' + smsCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 46,
      height: 46,
      textStyle: TextStyle(
          fontSize: 16,
          // color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(164, 167, 161, 1)),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(177, 238, 192, 0.76)),
      borderRadius: BorderRadius.circular(12),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromARGB(92, 166, 252, 132),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromARGB(92, 243, 136, 136),
      ),
    );

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
              SizedBox(height: 15),
              normallText(
                  textData: 'Learn without limits',
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(textData: 'Your phone number', fontSize: 16),
                    SizedBox(height: 10),
                    IntlPhoneField(
                      controller: phoneController,
                      initialCountryCode: 'IN',
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(width: 0.7, color: Colors.black38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Colors.black45, width: 0.7),
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
                      ),
                      languageCode: "en",
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (country) {
                        print('Country changed to: ' + country.name);
                      },
                    ),

                    // OTP Section
                    if (ifOtpSent) ...[
                      SizedBox(height: 20),
                      boldText(textData: 'Phone OTP', fontSize: 16),
                      SizedBox(height: 10),
                      Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        errorPinTheme: errorPinTheme,
                        validator: (s) {
                          smsCode = s!;
                          return null;
                          // return s == '2222' ? null : 'Pin is incorrect';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      ),
                    ],

                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      child: FilledButton.icon(
                        icon: Icon(Icons.arrow_forward_ios_outlined, size: 15),
                        iconAlignment: IconAlignment.end,
                        onPressed: () {
                          if (ifOtpSent) {
                            signIn();
                          } else {
                            ifOtpSent = true;
                            setState(() {});
                          }
                        },
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: btnGreen,
                          foregroundColor: Colors.black,
                          iconColor: Colors.black,
                        ),
                        label: boldText(
                            textData:
                                ifOtpSent ? 'Verify and Continue' : 'Send OTP',
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider(thickness: 0.3)),
                        Text(" or "),
                        Expanded(child: Divider(thickness: 0.3)),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Other Sign In Button (Google/iOS/phone)
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            label: boldText(
                                textData: 'Sign in with Google', fontSize: 15),
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
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              label: boldText(
                                  textData: 'Sign in with Apple', fontSize: 15),
                              icon: Image.asset('assets/images/apple.png',
                                  height: 25),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                foregroundColor: Colors.black,
                                side:
                                    BorderSide(color: Colors.black, width: 0.3),
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            label: boldText(
                                textData: 'Sign in with e-mail', fontSize: 15),
                            icon: Icon(
                              Icons.mail,
                              size: 22,
                            ),
                            // icon: SvgPicture.asset(
                            //   'assets/images/phone.svg',
                            //   semanticsLabel: 'Phone Logo',
                            //   height: 20,
                            //   width: 20,
                            // ),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              foregroundColor: Colors.black,
                              side: BorderSide(color: Colors.black, width: 0.3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

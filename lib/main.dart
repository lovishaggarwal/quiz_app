// import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_1/data/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app_1/wrapper.dart';
// import 'package:quiz_app_1/quiz.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme:
          ThemeData(fontFamily: 'quicksand', scaffoldBackgroundColor: bgGrey),
      home: WrapperPage(),
    ),
  );
}

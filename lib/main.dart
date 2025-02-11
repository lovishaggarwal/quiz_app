import 'package:flutter/material.dart';
import 'package:quiz_app_1/dashboard.dart';
import 'package:quiz_app_1/data/constants.dart';
// import 'package:quiz_app_1/quiz.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'quicksand', scaffoldBackgroundColor: bgGrey),
      
      home: DashboardPage(),
    )
  );
}

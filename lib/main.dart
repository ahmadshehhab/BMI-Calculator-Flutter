import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ffi';
void main() => runApp(QuizPage());

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark(), /* ThemeData(

        textTheme: TextTheme(
          displaySmall: TextStyle(
            fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.red
          )
        )
      )*/
      home: input_page()
    );
  }
}

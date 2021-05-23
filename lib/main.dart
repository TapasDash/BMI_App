import 'package:flutter/material.dart';
import 'Screens/InputPage.dart';


void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
         //Now we will provide only those things that we want to chnage in the current theme of our app
        primaryColor: Color(0xFF0A0E21),
        //remove the '#' from the hex code and add 0xFF
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(title: 'BMI calcualtor'),
    );
  }
}

//this page is similar to App.js for react
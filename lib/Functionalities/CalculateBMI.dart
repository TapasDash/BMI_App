import 'dart:math';

class CalculateBMI {
  CalculateBMI({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi; //private variable only i.e Object methods can acces it

  String calculate() {
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(
        2); //it return a cdecimal point string upto how much decimal points i.e for eg _BMI would be 18.56
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretations() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to excercise more.';
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}

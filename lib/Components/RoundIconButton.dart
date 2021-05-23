import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 6,
      shape: CircleBorder(), //refer to ShapeBorder class documnetation
      fillColor: kFloatingActionButtonColor,
      constraints: BoxConstraints.tightFor(
        //default size of a floating action buttomn
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

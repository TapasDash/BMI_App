import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Widget cardChild;
  //bcoz of these curly braces now we'll have to use colour: while passing it to the constructor smae with below as well

  final Color colour;

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:onPress,
          child: Container(
        child: cardChild,
        margin: EdgeInsets.all(13),
        decoration:
            BoxDecoration(color: colour, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
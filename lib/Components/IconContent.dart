import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.gender});

  final String gender;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, //it will align the child along the center
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height:
              15, //it will determinw how much space there should be within icon and text
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

import 'package:bmi_app/Components/ReusableCard.dart';
import 'InputPage.dart';
import '../Components/BottomButton.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BMI Calculator")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Your Result',
                  textAlign: TextAlign.center,
                  style: kTileTextStyle,
                ),
              ),
            ),
            Expanded(
              flex:
                  5, // as we want this container to take 5 times the size of previous container
              child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(resultText.toUpperCase(), style: kResultTextStyle),
                      Text(bmiResult, style: kBMITextStyle),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center, //
                        style: kBMIResultMessageStyle,
                      )
                    ],
                  )),
            ),
            BottomButton(
              buttonTitle: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}

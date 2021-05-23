import 'ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/ReusableCard.dart';
import '../Components/IconContent.dart';
import '../Components/RoundIconButton.dart';
import '../constants.dart';
import '../Components/BottomButton.dart';
import '../Functionalities/CalculateBMI.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  InputPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int age = 18;
  //initial state
  int height = 150;

  //toggle variable
  Gender selectedGender;

  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () =>
                        {setState(() => selectedGender = Gender.male)},
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.mars, gender: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () =>
                        {setState(() => selectedGender = Gender.female)},
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, gender: 'FEMALE'),
                  ),
                ),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                          height
                              .toString(), // we have to convert it to string bcoz Text Widget takes a string so had to convert the number to string
                          style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    //context stores the current state of our app i.e how our app looks like
                    data: SliderTheme.of(context).copyWith(
                        //Now we will provide only those things that we want to chnage in the current theme of our app
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kInactiveSliderColor,
                        overlayColor: Color(0x29EB1555),
                        //0x29 represents 16% opacity i.e light around thumb of slider
                        thumbColor: Color(0xFFEB1555),
                        //thumbColor above didn't change its color to pink bcoz
                        //the default color of activeColor below was overddiing it so
                        //you have to add activeTrackColor to white and remove activeColor
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height
                            .toDouble(), // we have to convert it to double bcoz Slider Widget takes a double value so had to convert the int to double
                        min: 110,
                        max: 220,
                        // activeColor: Colors.white,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue
                                .round(); // round is used to make it a whole number i.e int
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT", style: kLabelTextStyle),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () =>
                                  {setState(() => weight = weight + 1)},
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () =>
                                  {setState(() => weight = weight - 1)},
                            ),
                          ])
                    ],
                  ),
                  colour: Color(0xFF1D1E33),
                )),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () => {setState(() => age = age + 1)},
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () => {setState(() => age = age - 1)},
                              ),
                            ])
                      ],
                    ),
                    colour: Color(0xFF1D1E33),
                  ),
                ),
              ],
            )),
            //bottom container
            BottomButton(
              buttonTitle: "CALCULATE",
              onTap: () {
                CalculateBMI calc =
                    CalculateBMI(height: height, weight: weight);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      //like props in react
                      bmiResult: calc.calculate(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretations()
                    )));
              },
            )
          ],
        ));
  }
}

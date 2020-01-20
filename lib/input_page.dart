import 'package:bmi_calculator/human.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_card.dart';
import 'constants.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final Human human = new Human(height: 175, weight: 50);

  void onGenderChange(Gender gender) {
    setState(() {
      if (human.getGender() == gender) {
        human.setGender(null);
      } else {
        human.setGender(gender);
      }
    });
  }

  void onHeighChange(double height) {
    setState(() {
      human.setHeight(height.round());
    });
  }

  Color getActivityColor(Gender gender) {
    return human.getGender() == gender ? kActiveCardColor : kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                    color: getActivityColor(Gender.male),
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: () => onGenderChange(Gender.male),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    color: getActivityColor(Gender.female),
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onPress: () => onGenderChange(Gender.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        human.getHeight().toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      overlayColor: kSecondaryColorTransparent,
                      thumbColor: kSecondaryColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: human.getHeight().toDouble(),
                      min: 140,
                      max: 210,
                      onChanged: onHeighChange,
                      inactiveColor: Color(0XFF8D8E98),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: BMICard(
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kSecondaryColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/constants.dart';

import 'package:bmi_calculator/classes/human.dart';
import 'package:bmi_calculator/classes/calculator_brain.dart';

import 'package:bmi_calculator/screens/result_page.dart';

import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/info_with_toggles.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final Human human = new Human(height: 175, weight: 50, age: 18);

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

  void onWeightChange(int weight) {
    setState(() {
      human.setWeight(weight);
    });
  }

  void onAgeChange(int age) {
    setState(() {
      human.setAge(age);
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
                  Slider(
                    value: human.getHeight().toDouble(),
                    min: 140,
                    max: 210,
                    onChanged: onHeighChange,
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
                    child: InfoWithToggles(
                      onPress: this.onWeightChange,
                      value: human.getWeight(),
                      label: 'WEIGHT',
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    color: kActiveCardColor,
                    child: InfoWithToggles(
                      onPress: this.onAgeChange,
                      value: human.getAge(),
                      label: 'AGE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onPress: () {
              if (human.getGender() != null) {
                CalculatorBrain calculatorBrain = new CalculatorBrain(
                  height: human.getHeight(),
                  weight: human.getWeight(),
                );
                Navigator.pushNamed(context, '/result',
                    arguments: ResultPageArguments(
                      bmiResult: calculatorBrain.calculateBMI(),
                      resultText: calculatorBrain.getResult(),
                      interpretationText: calculatorBrain.getInterpretation(),
                    ));
              }
            },
          ),
        ],
      ),
    );
  }
}

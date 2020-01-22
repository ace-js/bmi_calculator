import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResultPageArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kPageTitle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: BMICard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      arguments.resultText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      arguments.bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      arguments.interpretationText,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            label: 'RE-CALCULATE',
            onPress: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

class ResultPageArguments {
  ResultPageArguments({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretationText,
  });

  String bmiResult;
  String resultText;
  String interpretationText;
}

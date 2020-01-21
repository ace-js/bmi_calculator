import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class InfoWithToggles extends StatelessWidget {
  InfoWithToggles({@required this.onPress, @required this.value, this.label});

  final Function onPress;
  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(this.label, style: kLabelTextStyle),
        Text(
          this.value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              backgroundColor: Color(0XFF4C4F5E),
              onPress: () => this.onPress(value - 1),
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 15.0,
            ),
            RoundIconButton(
              backgroundColor: Color(0XFF4C4F5E),
              onPress: () => this.onPress(value + 1),
              icon: FontAwesomeIcons.plus,
            ),
          ],
        )
      ],
    );
  }
}

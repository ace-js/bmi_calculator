import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //extends dark theme
        primaryColor: Color(0xFF090b21),
        scaffoldBackgroundColor: Color(0xFF090b21),
        sliderTheme: SliderTheme.of(context).copyWith(
          inactiveTrackColor: Color(0XFF8D8E98),
          activeTrackColor: Colors.white,
          overlayColor: kSecondaryColorTransparent,
          thumbColor: kSecondaryColor,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage()
      },
    );
  }
}

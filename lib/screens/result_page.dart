import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/human.dart';
import 'package:bmi_calculator/page_footer.dart';
import 'package:flutter/material.dart';

const double labelSize = 22.0;

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Text renderBodyType(bodyType) {
    switch (bodyType) {
      case BodyType.normal:
        return Text(
          'Normal',
          style: TextStyle(color: Colors.green, fontSize: labelSize),
        );
      case BodyType.overweight:
      default:
        return Text(
          'Overweight',
          style: TextStyle(color: Colors.red, fontSize: labelSize),
        );
    }
  }

  Text renderBodyTypeDescription(bodyType) {
    switch (bodyType) {
      case BodyType.normal:
        return Text(
          'Good job',
          style: TextStyle(fontSize: labelSize),
        );
      case BodyType.overweight:
      default:
        return Text(
          'Hum Hummmmm',
          style: TextStyle(fontSize: labelSize),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ResultArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Your Result',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: kActiveCardColor,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            this.renderBodyType(arguments.bodyType),
                            Text(
                              arguments.bmi.toStringAsFixed(1),
                              style: TextStyle(
                                  fontSize: 80.0, fontWeight: FontWeight.bold),
                            ),
                            this.renderBodyTypeDescription(arguments.bodyType)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            PageFooter(
              label: 'RE-CALCULATE',
              onPress: () => Navigator.pop(context),
            )
          ],
        ));
  }
}

class ResultArguments {
  double bmi;
  BodyType bodyType;
  ResultArguments({@required this.bmi, @required this.bodyType});
}

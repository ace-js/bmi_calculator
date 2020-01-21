import 'package:flutter/material.dart';

import 'constants.dart';

class PageFooter extends StatelessWidget {
  PageFooter({@required this.onPress, this.label});
  final Function onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        color: kSecondaryColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.onPress,
    @required this.icon,
    this.backgroundColor = Colors.blue,
    this.size = 56.0,
    this.elevation = 6.0,
  });

  final Function onPress;
  final Color backgroundColor;
  final IconData icon;
  final double size;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPress,
      elevation: this.elevation,
      constraints: BoxConstraints.tightFor(width: this.size, height: this.size),
      fillColor: backgroundColor,
      shape: CircleBorder(),
      child: Icon(icon),
    );
  }
}

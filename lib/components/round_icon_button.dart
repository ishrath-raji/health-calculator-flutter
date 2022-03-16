import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      elevation: 6.0,
      fillColor: Color(0xCC4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      child: Icon(
        icon,
        size: 40.0,
      ),
    );
  }
}

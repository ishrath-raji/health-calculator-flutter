import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;

  BottomButton({@required this.buttonText, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            buttonText,
            style: kLargerButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

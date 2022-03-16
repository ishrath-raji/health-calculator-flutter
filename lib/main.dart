import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Color(0xFF0A0E21),
      //   textTheme: TextTheme(
      //     bodyText2: TextStyle(
      //       color: Color(0xFFFFFFFF),
      //     ),
      //   ),
      //   colorScheme: ColorScheme.fromSwatch().copyWith(
      //     primary: Color(0xFF0A0E21),
      //     secondary: Colors.purple,
      //   ),
      // ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
      ),
      home: InputPage(),
    );
  }
}

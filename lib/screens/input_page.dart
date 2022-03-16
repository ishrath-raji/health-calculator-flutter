import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // bool ageMinusButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    var ageMinusButtonDisabled = false;
    var weightMinusButtonDisabled = false;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('HEALTH CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    genderIcon: FontAwesomeIcons.mars,
                    genderText: 'MALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    genderIcon: FontAwesomeIcons.venus,
                    genderText: 'FEMALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ]),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
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
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 2.0,
                            activeTrackColor: Color(0xFFEB1555),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 24.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 250.0,
                            divisions: 250,
                            label: height.round().toString(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // RoundIconButton(
                          //   icon: Icons.remove,
                          //   onPressed: () {
                          //     setState(() {
                          //       weight--;
                          //     });
                          //   },
                          // ),
                          AbsorbPointer(
                            absorbing: weightMinusButtonDisabled,
                            child: RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight == 10) {
                                    weightMinusButtonDisabled = true;
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                            'Minimum weight reached!'),
                                        content: const Text(
                                            'Cannot calculate for weight less than 10.'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    weight--;
                                    weightMinusButtonDisabled = false;
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // RoundIconButton(
                          //   icon: Icons.remove,
                          //   onPressed: () {
                          //     setState(() {
                          //       age--;
                          //     });
                          //   },
                          // ),
                          AbsorbPointer(
                            absorbing: ageMinusButtonDisabled,
                            child: RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age == 10) {
                                    ageMinusButtonDisabled = true;
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title:
                                            const Text('Minimum age reached!'),
                                        content: const Text(
                                            'Cannot calculate for age less than 10.'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    age--;
                                    ageMinusButtonDisabled = false;
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                age++;
                                // ageMinusButtonDisabled = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          BottomButton(
              buttonText: 'CALCULATE',
              onTap: () {
                if (selectedGender == null) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Gender not selected!'),
                      content: const Text('Please select a gender first.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  CalculatorBrain calc = CalculatorBrain(
                    height: height,
                    weight: weight,
                    age: age,
                    gender: selectedGender,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultsPage(
                          bmiResults: calc.calculateBMI(),
                          bmiResultText: calc.getBMIResult(),
                          // bmiInterpretation: calc.getBMIInterpretation(),
                          bfpResults: calc.calculateBFP(),
                          bfpResultText: calc.getBFPResult(),
                          bmrResults: calc.calculateBMR(),
                        );
                      },
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}

import 'package:bmi_calculator/bmi_calculator_logic.dart';
import 'package:bmi_calculator/bmi_feedback.dart';
import 'package:bmi_calculator/icon_data.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveBoxColor;
  Color femaleCardColor = kInactiveBoxColor;
  int state = 1;
  int height = 180;
  int weight = 60;
  int age = 20;
  double bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      myColor: maleCardColor,
                      cardChild: const IconDataWidget(
                        iconText: "MALE",
                        iconData: FontAwesomeIcons.mars,
                      ),
                      onPress: () {
                        setState(() {
                          state = updateColor(state);
                          if (state < 0) {
                            maleCardColor = kActiveBoxColor;
                            femaleCardColor = kInactiveBoxColor;
                          } else {
                            maleCardColor = kInactiveBoxColor;
                            femaleCardColor = kActiveBoxColor;
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      myColor: femaleCardColor,
                      cardChild: const IconDataWidget(
                        iconText: "FEMALE",
                        iconData: FontAwesomeIcons.venus,
                      ),
                      onPress: () {
                        setState(() {
                          state = updateColor(state);
                          if (state > 0) {
                            femaleCardColor = kActiveBoxColor;
                            maleCardColor = kInactiveBoxColor;
                          } else {
                            femaleCardColor = kInactiveBoxColor;
                            maleCardColor = kActiveBoxColor;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        myColor: kInactiveBoxColor,
                        onPress: () {},
                        cardChild: Column(
                          children: <Widget>[
                            const Text(
                              "HEIGHT",
                              style: kTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumberStyle,
                                ),
                                const Text(
                                  "in",
                                  style: kTextStyle,
                                )
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 27.0,
                                ),
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: const Color(0xff8d8e98),
                                thumbColor: const Color(0xffeb1555),
                                overlayColor: const Color(0x29eb1555),
                              ),
                              child: Slider(
                                  value: height.toDouble(),
                                  min: 120.0,
                                  max: 220.0,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      height = newValue.round();
                                    });
                                  }),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      myColor: kInactiveBoxColor,
                      onPress: () {},
                      cardChild: Column(
                        children: [
                          const Text(
                            "WEIGHT",
                            style: kTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      myColor: kInactiveBoxColor,
                      onPress: () {},
                      cardChild: Column(
                        children: [
                          const Text(
                            "AGE",
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButtonWidget(
                buttonText: "CALCULATE",
                func: () {
                  bmiResult = BMICalculator(height: height, weight: weight)
                      .calculateBMI();
                  BMIFeedback bmiFeedback =
                      BMICalculator(height: height, weight: weight)
                          .getBMIResult(bmiResult);

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      bmiResult: bmiResult,
                      bmiFeedback: bmiFeedback,
                    );
                  }));
                }),
          ],
        ),
      ),
    );
  }

  int updateColor(int state) {
    state *= -1;
    return state;
  }
}

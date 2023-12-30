import 'package:bmi_calculator/bmi_feedback.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  final double bmiResult;
  final BMIFeedback bmiFeedback;

  const ResultPage({required this.bmiResult, required this.bmiFeedback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                myColor: kActiveBoxColor,
                onPress: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiFeedback.shortResult,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult.toStringAsFixed(1),
                      style: kBMITextStyle,
                    ),
                    Text(
                      bmiFeedback.feedback,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    BottomButtonWidget(
                      buttonText: "RE-CALCULATE",
                      func: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

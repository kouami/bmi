import 'dart:math';

import 'package:bmi_calculator/bmi_feedback.dart';

class BMICalculator {
  int height;
  int weight;

  BMICalculator({required this.height, required this.weight});

  double calculateBMI() {
    //double bmi = weight / pow(height / 100, 2);
    //return bmi.toStringAsFixed(1);
    return weight / pow(height / 100, 2);
  }

  BMIFeedback getBMIResult(double bmi) {
    if (bmi >= 25) {
      return BMIFeedback(
          shortResult: "Overweight",
          feedback:
              "You have a higher than normal body weight. Try to exercise more.");
    } else if (bmi > 18.5) {
      return BMIFeedback(
          shortResult: "Normal",
          feedback: "You have a normal body weight. Good job!");
    }
    return BMIFeedback(
        shortResult: "Underweight",
        feedback:
            "You have a lower than normal body weight. Try to eat a bit more.");
  }
}

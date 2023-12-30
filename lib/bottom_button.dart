import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final String buttonText;
  final void Function() func;

  BottomButtonWidget({required this.buttonText, required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: kBottomBoxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color myColor;
  final Widget? cardChild;
  final void Function() onPress;

  ReusableCard({required this.myColor, this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: myColor,
        ),
        child: cardChild,
      ),
    );
  }
}

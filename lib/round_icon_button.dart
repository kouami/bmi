import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() func;

  const RoundIconButton({required this.icon, required this.func});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: func,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xff4c4f5e),
      child: Icon(icon),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class IconDataWidget extends StatelessWidget {
  final String iconText;
  final IconData? iconData;

  const IconDataWidget({required this.iconText, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          iconData,
          size: 80.0,
          //color: const Color(0xff8d8e98),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          iconText,
          style: kTextStyle,
        )
      ],
    );
  }
}

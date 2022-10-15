import 'package:flutter/cupertino.dart';

import '../../config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? mercadinTitleColor;
  final double textSize;

  const AppNameWidget({
    Key? key,
    this.mercadinTitleColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text.rich(TextSpan(
          style: TextStyle(
            fontSize: textSize,
          ),
          children: [
            TextSpan(
                text: 'Mercadin',
                style: TextStyle(
                  color: mercadinTitleColor ?? CustomColors.customSwatchColor,
                )),
            TextSpan(
                text: '24H',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ))
          ])),
    );
  }
}

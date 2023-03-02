import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:wellbeing_tracker/constants.dart';

class ColoredContainer extends StatelessWidget {
  final String title1;
  final String title2;
  final Widget? button;
  final double? width;
  final double? height;
  final Widget? content;
  final Color? color;
  const ColoredContainer({
    Key? key,
    required this.title1,
    required this.title2,
    this.button,
    this.width,
    this.height,
    this.content,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color ?? Constants().accentColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(title1, style: Constants().smallText.copyWith(color: Colors.grey),),
              Text(title2, style: Constants().mediumText.copyWith(color: Constants().primaryColor),),
              Constants().spacing,
              if(button != null) Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Constants().primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: button
              )
            ],
          ),
          if(content != null) const Spacer(),
          if(content != null) content!,
          if(content != null) const Spacer(),
        ],
      ),
    );
  }
}

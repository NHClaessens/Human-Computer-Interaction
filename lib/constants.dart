import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  Color primaryColor = const Color(0xff003441);

  Color accentColor = const Color(0xffeafab0);

  EdgeInsets normalPadding = const EdgeInsets.only(left: 30, top: 30, right: 30);

  final double largeTextSize = 30;
  final double mediumTextSize = 20;
  final double smallTextSize = 15;

  late TextStyle mediumText = TextStyle(
    color: Colors.grey,
    fontSize: mediumTextSize,
    fontWeight: FontWeight.w600
  );
  late TextStyle largeText = TextStyle(
    color: primaryColor,
    fontSize: largeTextSize,
    fontWeight: FontWeight.w600
  );
  late TextStyle smallText = TextStyle(
    color: primaryColor,
    fontSize: smallTextSize,
    fontWeight: FontWeight.w600
  );

  SizedBox spacing = const SizedBox(
    height: 16,
    width: 16,
  );
}
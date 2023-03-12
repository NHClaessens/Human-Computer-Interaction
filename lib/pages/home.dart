import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';
import 'package:wellbeing_tracker/widgets/moodselector.dart';
import 'package:wellbeing_tracker/widgets/progress.dart';
import 'package:wellbeing_tracker/widgets/statistics.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Constants().normalPadding,
      // crossAxisAlignment: CrossAxisAlignment.baseline,
      // textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          "hello, ${context.read<BackEnd>().name} 👋",
          style: Constants().mediumText
        ),
        Text(
          "welcome back!",
          style:  Constants().largeText
        ),
        Constants().spacing,
        Text(
          "how are you feeling today?",
          style:  Constants().smallText
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: MoodSelector(),
        ),
        Constants().spacing,
        Text(
          "your progress",
          style: Constants().largeText
        ),
        Text(
          DateFormat.EEEE().format(DateTime.now()).toLowerCase(),
          style: Constants().mediumText
        ),
        const Progress(),
        Constants().spacing,
        Text(
          "your statistics",
          style: Constants().largeText
        ),
        const Statistics()


      ],
    );
  }
}
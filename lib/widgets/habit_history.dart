import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class HabitHistory extends StatefulWidget {
  const HabitHistory({super.key});

  @override
  State<HabitHistory> createState() => _HabitHistoryState();
}

class _HabitHistoryState extends State<HabitHistory> {

  Widget circle(String string, double progress) {
    if(progress == 1) {
      return CircleAvatar(
        radius: 20,
        backgroundColor: Constants().primaryColor,
        child: FaIcon(FontAwesomeIcons.check, color: Constants().accentColor,),
      );
    } else {
      return CircularPercentIndicator(
        percent: progress,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Constants().primaryColor,
        backgroundColor: Colors.grey.shade300,
        radius: 20,
        center: Text(string, style: Constants().mediumText.copyWith(color: Constants().primaryColor),),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        circle("m", context.read<BackEnd>().habitHistory[0]),
        circle("t", context.read<BackEnd>().habitHistory[1]),
        circle("w", context.read<BackEnd>().habitHistory[2]),
        circle("t", context.read<BackEnd>().habitHistory[3]),
        circle("f", context.read<BackEnd>().habitHistory[4]),
        circle("s", context.read<BackEnd>().habitHistory[5]),
        circle("s", context.read<BackEnd>().habitHistory[6]),
      ],
    );
  }
}
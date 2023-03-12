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

  Widget circle(String string, double progress, int day) {
    if(progress == 1) {
      return CircleAvatar(
        radius: 20,
        backgroundColor: DateTime.now().weekday == day ? Constants().accentColor : Constants().primaryColor,
        child: FaIcon(FontAwesomeIcons.check, color: DateTime.now().weekday == day ? Constants().primaryColor : Constants().accentColor,),
      );
    } else {
      return Container(
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: DateTime.now().weekday == day ? Constants().accentColor : Colors.transparent,
        ),
        child: CircularPercentIndicator(
          animateFromLastPercent: true,
          percent: progress,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Constants().primaryColor,
          backgroundColor: Colors.grey.shade300,
          
          radius: 20,
          center: Text(string, style: Constants().mediumText.copyWith(color: Constants().primaryColor),),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        circle("m", context.watch<BackEnd>().habitHistory[0], 1),
        circle("t", context.watch<BackEnd>().habitHistory[1], 2),
        circle("w", context.watch<BackEnd>().habitHistory[2], 3),
        circle("t", context.watch<BackEnd>().habitHistory[3], 4),
        circle("f", context.watch<BackEnd>().habitHistory[4], 5),
        circle("s", context.watch<BackEnd>().habitHistory[5], 6),
        circle("s", context.watch<BackEnd>().habitHistory[6], 7),
      ],
    );
  }
}
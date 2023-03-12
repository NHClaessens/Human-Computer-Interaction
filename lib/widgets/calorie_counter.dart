import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class CalorieCounter extends StatefulWidget {
  const CalorieCounter({super.key});

  @override
  State<CalorieCounter> createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Constants().primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text("calories", style: Constants().mediumText.copyWith(color: Colors.white),),
              CircularPercentIndicator(
                animateFromLastPercent: true,
                radius: MediaQuery.of(context).size.width * 0.20,
                lineWidth: 20,
                percent: context.watch<BackEnd>().currentCalories / context.watch<BackEnd>().calorieGoal,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.white,
                backgroundColor: Colors.grey,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${context.watch<BackEnd>().calorieGoal - context.watch<BackEnd>().currentCalories}", style: const TextStyle(color: Colors.white, fontSize: 30), textAlign: TextAlign.center,),
                    const Text("remaining", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.flag, color: Constants().accentColor),
                  Constants().spacing,
                  Text("base goal\n${context.watch<BackEnd>().calorieGoal}", style: Constants().smallText.copyWith(color: Colors.white),)
                ],
              ),
              Constants().spacing,
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.utensils, color: Constants().accentColor),
                  Constants().spacing,
                  Text("food\n${context.watch<BackEnd>().currentCalories}", style: Constants().smallText.copyWith(color: Colors.white),)
                ],
              ),
              Constants().spacing,
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.fireFlameCurved, color: Constants().accentColor),
                  Constants().spacing,
                  Text("exercise\n0", style: Constants().smallText.copyWith(color: Colors.white),)
                ],
              ),
            ],
          ),
          Constants().spacing,
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class HabitProgress extends StatefulWidget {
  const HabitProgress({super.key});

  @override
  State<HabitProgress> createState() => _HabitProgressState();
}

class _HabitProgressState extends State<HabitProgress> {
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
              Text("you're almost there", style: Constants().smallText.copyWith(color: Colors.white),),
              Text("${context.read<BackEnd>().habits.where((element) => element.current >= element.goal).length}/${context.read<BackEnd>().habits.length} daily goals completed", style: Constants().smallText.copyWith(color: Colors.grey))
            ],
          ),
          const Spacer(),
          CircularPercentIndicator(
            animation: true,
            animateFromLastPercent: true,
            radius: 40,
            lineWidth: 10,
            percent: context.watch<BackEnd>().habits.isEmpty ? 1 :context.read<BackEnd>().habits.where((element) => element.current >= element.goal).length / context.read<BackEnd>().habits.length,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            center: Text("${context.watch<BackEnd>().habits.isEmpty ? 100 : (context.watch<BackEnd>().habits.where((element) => element.current >= element.goal).length / context.read<BackEnd>().habits.length * 100).floor()}%", style: Constants().mediumText.copyWith(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/widgets/habit_history.dart';
import 'package:wellbeing_tracker/widgets/habit_list.dart';
import 'package:wellbeing_tracker/widgets/habit_progress.dart';

class Habits extends StatefulWidget {
  const Habits({super.key});

  @override
  State<Habits> createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Constants().normalPadding,
      children: [
        Text("my habits", style: Constants().largeText,),
        Constants().spacing,
        const HabitHistory(),
        Constants().spacing,
        const HabitProgress(),
        Constants().spacing,
        const HabitList(),
        const SizedBox(
          height: 100,
        )
      ]
    );
  }
}
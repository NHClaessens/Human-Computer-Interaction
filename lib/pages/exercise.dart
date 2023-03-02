import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/widgets/colored_box.dart';
import 'package:wellbeing_tracker/widgets/exercise_ideas.dart';
import 'package:wellbeing_tracker/widgets/exercise_statisitcs.dart';
import 'package:wellbeing_tracker/widgets/past_workouts.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Constants().normalPadding,
      children: [
        Text("my workouts", style: Constants().largeText,),
        Constants().spacing,
        const ExercisesStatistics(),
        Constants().spacing,
        Text("workout ideas", style: Constants().largeText,),
        const ExerciseIdeas(),
        Constants().spacing,
        Text("your past workouts", style: Constants().largeText,),
        Constants().spacing,
        ColoredContainer(title1: "weekly", title2: "overview", height: 300, color: Colors.grey.shade300),
      ],
    );
  }
}
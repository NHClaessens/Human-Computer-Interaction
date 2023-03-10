import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/widgets/colored_box.dart';
import 'dart:math' as math;

class ExerciseIdeas extends StatefulWidget {
  const ExerciseIdeas({super.key});

  @override
  State<ExerciseIdeas> createState() => _ExerciseIdeasState();
}

class _ExerciseIdeasState extends State<ExerciseIdeas> {

  Widget exerciseTile(String title1, String title2, int duration, Color? color) {
    return ColoredContainer(width: 250, title1: title1, title2: title2, color: color, button:  Row(
        children: [
          const FaIcon(FontAwesomeIcons.stopwatch, color: Colors.white,),
          Constants().spacing,
          Text("$duration min", style: Constants().smallText.copyWith(color: Colors.white),)
        ],
      ),
      content: Transform.rotate(angle: 45 * math.pi / 180,child: FaIcon(FontAwesomeIcons.dumbbell, color: Constants().primaryColor, size: 50,)),
    );
  }

  final PageController _controller = PageController();

  void switchToPage(int index) {
    setState(() {
      _index = index;
    });
    _controller.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  int _index = 0;

  late List<Widget> workouts = [
    ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        exerciseTile("daily", "warmup", 15, Constants().accentColor),
        exerciseTile("full body", "workout", 35, Constants().accentColor),
        exerciseTile("strength", "training", 20, Constants().accentColor),
        exerciseTile("core", "strengthening", 25, Constants().accentColor),
      ],
    ),
    ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        exerciseTile("daily", "warmup", 25, Colors.yellow.shade100),
        exerciseTile("full body", "workout", 45, Colors.yellow.shade100),
        exerciseTile("strength", "training", 30, Colors.yellow.shade100),
        exerciseTile("core", "strengthening", 35, Colors.yellow.shade100),
      ],
    ),
    ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        exerciseTile("daily", "warmup", 35, Colors.orange.shade100),
        exerciseTile("full body", "workout", 55, Colors.orange.shade100),
        exerciseTile("strength", "training", 40, Colors.orange.shade100),
        exerciseTile("core", "strengthening", 45, Colors.orange.shade100),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => switchToPage(0),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: _index == 0 ? Constants().primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("beginner", style: Constants().smallText.copyWith(color: _index == 0 ? Constants().accentColor : Colors.grey),),
              ),
            ),
            Constants().spacing,
            GestureDetector(
              onTap: () => switchToPage(1),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: _index == 1 ? Constants().primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("intermediate", style: Constants().smallText.copyWith(color: _index == 1 ? Constants().accentColor : Colors.grey),),
              ),
            ),
            Constants().spacing,
            GestureDetector(
              onTap: () => switchToPage(2),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: _index == 2 ? Constants().primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("expert", style: Constants().smallText.copyWith(color: _index == 2 ? Constants().accentColor : Colors.grey),),
              ),
            ),
            Constants().spacing,
          ],
        ),
        Constants().spacing,
        SizedBox(
          width: MediaQuery.of(context).size.width - 60,
          height: 140,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: workouts,
          ),
        )
      ],
    );
  }
}
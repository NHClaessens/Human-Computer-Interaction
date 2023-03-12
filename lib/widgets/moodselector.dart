import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class MoodSelector extends StatefulWidget {
  const MoodSelector({super.key});

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  List<String> emojis = [
    "😔",
    "😤",
    "😐",
    "😃",
    "😁",
  ];


  Widget button(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(index == context.read<BackEnd>().currentMood) {
            context.read<BackEnd>().currentMood = -1;
          } else {
            context.read<BackEnd>().currentMood = index;
          }
        });
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: context.read<BackEnd>().currentMood == index ? Constants().primaryColor : Colors.grey.shade300,
        child: Text(emojis[index], style: const TextStyle(fontSize: 30),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        button(0),
        button(1),
        button(2),
        button(3),
        button(4),
      ],
    );
  }
}
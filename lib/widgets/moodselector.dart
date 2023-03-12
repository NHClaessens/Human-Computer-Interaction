import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wellbeing_tracker/constants.dart';

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

  int _index = -1;

  Widget button(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(index == _index) {
            _index = -1;
          } else {
            _index = index;
          }
        });
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: _index == index ? Constants().primaryColor : Colors.grey.shade300,
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
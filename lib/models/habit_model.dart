import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HabitModel {
  IconData icon;
  String title;
  double current;
  double goal;
  String unit;

  HabitModel({
    required this.icon,
    required this.title,
    required this.current,
    required this.goal,
    required this.unit,
  });
  

  @override
  String toString() {
    return 'HabitModel(icon: $icon, title: $title, current: $current, goal: $goal, unit: $unit)';
  }
}

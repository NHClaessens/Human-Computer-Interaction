import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/models/habit_model.dart';

class BackEnd extends ChangeNotifier{
  String name = "nils";
  int weight = 78;
  int weightLoss = -8;

  int currentCalories = 1000;
  int calorieGoal = 3000;

  double currentWater = 300;
  double waterGoal = 1500;

  void setWater(double water) {
    currentWater = water;
    if(currentWater > waterGoal) {
      currentWater = waterGoal;
    }
    habits[0].current = currentWater.toInt();
    notifyListeners();
  }

  late List<HabitModel> habits = [
    HabitModel(
      icon: SizedBox(width: 25, height: 25, child: FaIcon(FontAwesomeIcons.book, color: Constants().accentColor)), 
      title: "Drink water", 
      current: currentWater.toInt(), 
      goal: waterGoal.toInt(), 
      unit: "pcs"
    ),
    HabitModel(
      icon: SizedBox(width: 25, height: 25, child: FaIcon(FontAwesomeIcons.book, color: Constants().accentColor)), 
      title: "Habits created", 
      current: 4, 
      goal: 10, 
      unit: "pcs"
    ),
    HabitModel(
      icon: SizedBox(width: 25, height: 25, child: FaIcon(FontAwesomeIcons.weightScale, color: Constants().accentColor)), 
      title: "Weight lost", 
      current: 8, 
      goal: 15, 
      unit: "KGs"
    ),
    HabitModel(
      icon: SizedBox(width: 25, height: 25, child: FaIcon(FontAwesomeIcons.dumbbell, color: Constants().accentColor)), 
      title: "Being active", 
      current: 27, 
      goal: 30, 
      unit: "min"
    ),
    HabitModel(
      icon: SizedBox(width: 25, height: 25, child: FaIcon(FontAwesomeIcons.faceSmile, color: Constants().accentColor)), 
      title: "Mood tracked", 
      current: 28, 
      goal: 28, 
      unit: "times"
    ),
  ];

  void completeHabit(int index) {
    habits[index].current = habits[index].goal;

    if(index == 0) {
      currentWater = waterGoal;
    }
    notifyListeners();
  }

  void resetHabit(int index) {
    habits[index].current = 0;

    if(index == 0) {
      currentWater = 0;
    }
    notifyListeners();
  }

  List<double> habitHistory = [
    0.3,
    1,
    1,
    0.6,
    0.7,
    1,
    0.2,
  ];

  Widget? popup;

  void setPopup(Widget? widget, Function function) {
    if(widget == null) {
      popup = null;
      return;
    }

    popup = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  widget,
                  Constants().spacing,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popup = null;
                          notifyListeners();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Constants().primaryColor,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: const Text("Cancel", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Constants().spacing,
                      GestureDetector(
                        onTap: () {
                          function();
                          popup = null;
                          notifyListeners();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Constants().primaryColor,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: const Text("Confirm", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
    notifyListeners();
  }
}
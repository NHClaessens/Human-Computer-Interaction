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

  int currentCalories = 0;
  int calorieGoal = 3000;

  double currentWater = 0;
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
      icon: FontAwesomeIcons.book, 
      title: "Drink water", 
      current: currentWater.toInt(), 
      goal: waterGoal.toInt(), 
      unit: "pcs"
    ),
    HabitModel(
      icon: FontAwesomeIcons.book, 
      title: "Habits created", 
      current: 1, 
      goal: 10, 
      unit: "pcs"
    ),
  ];

  void updateProgressToday() {
    habitHistory[DateTime.now().weekday - 1] = getProgress();
    notifyListeners();
  }

  double getProgress() {
    return habits.where((element) => element.current == element.goal).length / habits.length;
  }

  void completeHabit(int index) {
    habits[index].current = habits[index].goal;

    if(index == 0) {
      currentWater = waterGoal;
    }

    updateProgressToday();

    notifyListeners();
  }

  void resetHabit(int index) {
    habits[index].current = 0;

    if(index == 0) {
      currentWater = 0;
    }

    updateProgressToday();

    notifyListeners();
  }

  late List<double> habitHistory = [
    DateTime.now().weekday == 1 ? getProgress() : 0.3,
    DateTime.now().weekday == 2 ? getProgress() : 1,
    DateTime.now().weekday == 3 ? getProgress() : 1,
    DateTime.now().weekday == 4 ? getProgress() : 0.6,
    DateTime.now().weekday == 5 ? getProgress() : 0.7,
    DateTime.now().weekday == 6 ? getProgress() : 1,
    DateTime.now().weekday == 7 ? getProgress() : 0.2,
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
                          updateProgressToday();
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
    // updateProgressToday();
    notifyListeners();
  }
}
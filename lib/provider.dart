import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/models/habit_model.dart';

class BackEnd extends ChangeNotifier{
  String name = "nils";
  double weight = 78;

  int currentMood = -1;

  int currentCalories = 0;
  int calorieGoal = 3000;

  double currentWater = 0;
  double waterGoal = 1500;

  void addWater(double water) {
    setWater(currentWater + water);
  }

  void setWater(double water) {
    currentWater = water;
    if(currentWater > waterGoal) currentWater = waterGoal;
    if(currentWater < 0) currentWater = 0;
    
    notifyListeners();
  }

  void addCalories(int calories) {
    currentCalories += calories;
    if(currentCalories > calorieGoal) currentCalories = calorieGoal;
    if(currentCalories < 0) currentCalories = 0;
    notifyListeners();
  }

  late List<HabitModel> habits = [
    HabitModel(
      icon: FontAwesomeIcons.dumbbell, 
      title: "Do pushups", 
      current: 0, 
      goal: 10, 
      unit: ""
    ),
    HabitModel(
      icon: FontAwesomeIcons.peace, 
      title: "Meditate", 
      current: 0, 
      goal: 10, 
      unit: "minutes"
    ),
  ];

  void updateHabit(int index, double amount) {
    habits[index].current += amount;
    if(habits[index].current > habits[index].goal) habits[index].current = habits[index].goal;
    if(habits[index].current < 0) habits[index].current = 0;
    habitHistory[DateTime.now().weekday - 1] = getProgress();
    notifyListeners();
  }

  void updateProgressToday() {
    habitHistory[DateTime.now().weekday - 1] = getProgress();
    notifyListeners();
  }

  double getProgress() {
    return habits.isEmpty ? 1 : habits.where((element) => element.current == element.goal).length / habits.length;
  }

  void completeHabit(int index) {
    habits[index].current = habits[index].goal;

    updateProgressToday();

    notifyListeners();
  }

  void resetHabit(int index) {
    habits[index].current = 0;

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

  void removeHabit(int index) {
    habits.removeAt(index);
    habitHistory[DateTime.now().weekday - 1] = getProgress();
    notifyListeners();
  }

  List<double> weights = [86, 80, 86, 82, 84, 78];

  void addWeight(double w) {
    weights.add(w);
    weight = w;
    notifyListeners();
  }
}
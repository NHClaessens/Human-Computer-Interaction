import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';
import 'package:wellbeing_tracker/widgets/calorie_counter.dart';
import 'package:wellbeing_tracker/widgets/colored_box.dart';
import 'package:wellbeing_tracker/widgets/water_counter.dart';
import 'dart:math' as math;

import 'package:wellbeing_tracker/widgets/water_counter2.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  final TextEditingController calorieAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Constants().normalPadding,
      children: [
        Text("my food", style: Constants().largeText,),
        Constants().spacing,
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            children: [
              Text("add new meal", style: Constants().mediumText.copyWith(color: Constants().primaryColor),),
              const Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: Constants().primaryColor,
                child: IconButton(onPressed: (){
                  context.read<BackEnd>().setPopup(
                    SizedBox(
                      width: 200,
                      height: 100,
                      child: TextField(
                        controller: calorieAmountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "amount of calories"
                        ),
                      ),
                    ),
                    (){
                      context.read<BackEnd>().addCalories(int.parse(calorieAmountController.text));
                    }
                  );
                }, icon: FaIcon(FontAwesomeIcons.plus, color: Constants().accentColor), splashColor: Colors.transparent,)
              )
            ],
          ),
        ),
        Constants().spacing,
        const CalorieCounter(),
        Constants().spacing,
        const WaterCounter(),
        const WaterCounter2(),
        Text("meal plans", style: Constants().largeText,),
        SizedBox(
          height: 125,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              ColoredContainer(title1: "classic", title2: "diet", button: const Text("Explore", style: TextStyle(color: Colors.white),), width: 200, content: Transform.rotate(angle: 45 * math.pi / 180,child: FaIcon(FontAwesomeIcons.burger, color: Constants().primaryColor, size: 50,))),
              ColoredContainer(title1: "keto", title2: "diet", button: const Text("Explore", style: TextStyle(color: Colors.white),), width: 200, content: Transform.rotate(angle: 45 * math.pi / 180,child: FaIcon(FontAwesomeIcons.bowlFood, color: Constants().primaryColor, size: 50,))),
              ColoredContainer(title1: "vegan", title2: "diet", button: const Text("Explore", style: TextStyle(color: Colors.white),), width: 200, content: FaIcon(FontAwesomeIcons.wheatAwn, color: Constants().primaryColor, size: 50,)),
              ColoredContainer(title1: "mixed", title2: "diet", button: const Text("Explore", style: TextStyle(color: Colors.white),), width: 200, content: Transform.rotate(angle: 45 * math.pi / 180,child: FaIcon(FontAwesomeIcons.burger, color: Constants().primaryColor, size: 50,))),
            ],
          ),
        ),
        const SizedBox(
          height: 200,
        ),

      ],
    );
  }
}
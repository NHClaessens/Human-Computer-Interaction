import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class WaterCounter extends StatefulWidget {
  final VoidCallback switchView;
  const WaterCounter({
    Key? key,
    required this.switchView,
  }) : super(key: key);

  @override
  State<WaterCounter> createState() => _WaterCounterState();
}

class _WaterCounterState extends State<WaterCounter> {

  final TextEditingController waterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.watch<BackEnd>();
    waterController.text = "${context.watch<BackEnd>().currentWater.round()}";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text("water intake", style: Constants().mediumText.copyWith(color: Constants().primaryColor)),
                  Text("1.5 liters recommended", style: Constants().smallText.copyWith(color: Colors.grey)),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: (){widget.switchView();}, icon: FaIcon(FontAwesomeIcons.rightLeft, color: Constants().primaryColor,), iconSize: 15),
            ],
          ),
          Constants().spacing,
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 150);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 30,),
                      const Spacer(),
                      const Text("150ml")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 200);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 35,),
                      const Spacer(),
                      const Text("200ml")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 250);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 40,),
                      const Spacer(),
                      const Text("250ml")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 300);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 45,),
                      const Spacer(),
                      const Text("300ml")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 350);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 50,),
                      const Spacer(),
                      const Text("350ml")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Constants().spacing,
          Row(
            children: [
              IntrinsicWidth(
                child: TextField(
                  controller: waterController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "__",
                  ),
                  onSubmitted: (value) {
                    context.read<BackEnd>().setWater(double.parse(value));
                  },
                ),
              ),
              Text("/ ${context.watch<BackEnd>().waterGoal.round()} ml", style: Constants().smallText,),
            ],
          ),
          Constants().spacing,
          Slider(
            min: 0,
            divisions: (context.read<BackEnd>().waterGoal / 10).round(),
            max: context.read<BackEnd>().waterGoal,
            value: context.watch<BackEnd>().currentWater, 
            onChanged: (value){context.read<BackEnd>().setWater(value);},
            activeColor: Constants().primaryColor,
            inactiveColor: Colors.grey,
          )
        ],
      ),
    );
  }
}